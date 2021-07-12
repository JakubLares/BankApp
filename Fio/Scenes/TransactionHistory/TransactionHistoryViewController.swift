//
//  TransactionHistoryViewController.swift
//  Fio
//
//  Created by Jakub Lares on 12.07.2021.
//

import UIKit
import Combine

class TransactionHistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var viewModel = TransactionHistoryViewModel()
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        setupViewModel()
        viewModel.loadPayments()
    }

    private func setupUI() {
        title = LocalizableStrings.TransactionHistory.title
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(cell: TableViewCells.transactionHistory)
        tableView.tableFooterView = UIView()
    }

    private func setupViewModel() {
        viewModel.$payments
            .receive(on: DispatchQueue.main)
            .sink { _ in self.tableView.reloadData() }
            .store(in: &cancellables)
    }

}

extension TransactionHistoryViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.payments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCells.transactionHistory, for: indexPath)
        viewModel.setupCell(cell as? TransactionHistoryTableViewCell, indexPath: indexPath)
        return cell
    }

}
