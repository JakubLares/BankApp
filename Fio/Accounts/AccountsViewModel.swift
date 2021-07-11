//
//  AccountsViewModel.swift
//  Fio
//
//  Created by Jakub Lares on 11.07.2021.
//

import Combine
import Foundation

class AccountsViewModel {

    @Published var acccounts = [AccountsResponse.Account]()
    private var cancellables = Set<AnyCancellable>()

    func loadAccounts() {
       APIClient.shared.getAccounts()
        .sink { completion in
            switch completion {
            case .failure(let error):
                print(error)
            case .finished:
                print("success")
            }
        } receiveValue: { accountsReponse in
            self.acccounts = accountsReponse.accounts
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

}
