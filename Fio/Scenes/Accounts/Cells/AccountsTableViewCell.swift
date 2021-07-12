//
//  AccountsTableViewCell.swift
//  Fio
//
//  Created by Jakub Lares on 11.07.2021.
//

import UIKit

class AccountsTableViewCell: UITableViewCell {

    @IBOutlet private weak var borderBackgroundView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var balanceLabel: UILabel!
    @IBOutlet private weak var currencyLabel: UILabel!
    @IBOutlet private weak var accountNumberLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        borderBackgroundView.layer.cornerRadius = 8
        borderBackgroundView.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        borderBackgroundView.layer.borderWidth = 1
    }

    func setupCell(name: String, balance: String, currency: String, accountNumber: String) {
        nameLabel.text = name
        balanceLabel.text = balance
        currencyLabel.text = currency
        accountNumberLabel.text = accountNumber
    }
    
}
