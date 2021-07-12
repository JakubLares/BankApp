//
//  TransactionHistoryTableViewCell.swift
//  Fio
//
//  Created by Jakub Lares on 11.07.2021.
//

import UIKit

class TransactionHistoryTableViewCell: UITableViewCell {

    @IBOutlet private weak var amountLabel: UILabel!
    @IBOutlet private weak var currencyLabel: UILabel!
    @IBOutlet private weak var accountNumberLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupCell(amount: String, currency: String, accountNumber: String) {
        amountLabel.text = amount
        currencyLabel.text = currency
        accountNumberLabel.text = accountNumber
    }
    
}
