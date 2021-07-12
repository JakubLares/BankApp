//
//  AccountsTableViewController.swift
//  Fio
//
//  Created by Jakub Lares on 11.07.2021.
//

import UIKit
import Combine

class AccountsViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    private var viewModel = AccountsViewModel()
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupTableView()
        setupViewModel()
        viewModel.loadAccounts()
    }

    private func setupUI() {
        title = LocalizableStrings.accounts
        navigationController?.navigationBar.prefersLargeTitles = true

        let paymentButton = UIBarButtonItem(image: Images.newPayment, style: .done, target: self, action: #selector((paymentButtonPressed)))
        navigationItem.rightBarButtonItem = paymentButton
        let historyButton = UIBarButtonItem(image: Images.transactionHistory, style: .done, target: self, action: #selector((transactionHistoryButtonPressed)))
        navigationItem.leftBarButtonItem = historyButton
    }

    @objc private func paymentButtonPressed() {
        guard let newPaymentViewController = StoryboardScene.paymentForm else { return }
        navigationController?.pushViewController(newPaymentViewController, animated: true)
    }

    @objc private func transactionHistoryButtonPressed() {
        guard let newPaymentViewController = StoryboardScene.transactionHistory else { return }
        navigationController?.pushViewController(newPaymentViewController, animated: true)
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(cell: TableViewCells.accounts)
    }

    private func setupViewModel() {
        viewModel.$acccounts
            .receive(on: DispatchQueue.main)
            .sink { _ in self.tableView.reloadData() }
            .store(in: &cancellables)

        viewModel.showError
            .receive(on: DispatchQueue.main)
            .sink { [weak self] alert in
                self?.present(alert, animated: true)
            }
            .store(in: &cancellables)
    }

}

extension AccountsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.acccounts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCells.accounts, for: indexPath)
        viewModel.setupCell(cell as? AccountsTableViewCell, indexPath: indexPath)
        return cell
    }

}
