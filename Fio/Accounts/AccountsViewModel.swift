//
//  AccountsViewModel.swift
//  Fio
//
//  Created by Jakub Lares on 11.07.2021.
//

import Combine
import UIKit

class AccountsViewModel {

    @Published var acccounts = [AccountsResponse.Account]()
    var showError = PassthroughSubject<UIAlertController, Never>()

    private var cancellables = Set<AnyCancellable>()

    func loadAccounts() {
       APIClient.shared.getAccounts()
        .retry(3)
        .receive(on: DispatchQueue.main)
        .sink { [weak self] completion in
            switch completion {
            case .failure(_):
                self?.showDownloadError()
            case .finished:
                break
            }
        } receiveValue: { [weak self] accountsReponse in
            self?.acccounts = accountsReponse.accounts
        }
       .store(in: &cancellables)
    }

    func setupCell(_ cell: AccountsTableViewCell?, indexPath: IndexPath) {
        guard let cell = cell else { return }

        let account = acccounts[indexPath.row]
        cell.setupCell(name: account.name,
                       balance: "\(account.balance)",
                       currency: account.currency,
                       accountNumber: "\(account.number)/2010"
        )
    }

    private func showDownloadError() {
        let alert = UIAlertController(title: nil, message: LocalizableStrings.downloadFailed, preferredStyle: .alert)
        let retryAction = UIAlertAction(title: LocalizableStrings.retry, style: .default) { [weak self] _ in
            self?.loadAccounts()
        }
        alert.addAction(retryAction)
        showError.send(alert)
    }

}
