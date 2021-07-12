//
//  TransactionHistoryViewModel.swift
//  Fio
//
//  Created by Jakub Lares on 12.07.2021.
//

import Foundation
import Combine

class TransactionHistoryViewModel {

    @Published var payments: [Payment] = []

    func loadPayments() {
        payments = FileClient.shared.loadPayments()
    }

    func setupCell(_ cell: TransactionHistoryTableViewCell?, indexPath: IndexPath) {
        guard let cell = cell else { return }

        let payment = payments[indexPath.row]
        cell.setupCell(
            amount: "\(payment.amount)",
            currency: LocalizableStrings.czechCrown,
            accountNumber: "\(payment.toAccount)/\(payment.bankCode)"
        )
    }

}
