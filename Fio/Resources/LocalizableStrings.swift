//
//  LocalizableStrings.swift
//  Fio
//
//  Created by Jakub Lares on 11.07.2021.
//

import Foundation

struct LocalizableStrings {

    static var czechCrown = NSLocalizedString("CzechCrown", comment: "")

    struct Accounts {
        static var title = NSLocalizedString("accounts.title", comment: "")
        static var errorMessage = NSLocalizedString("accounts.errorMessage", comment: "")
        static var errorRetry = NSLocalizedString("accounts.errorRetry", comment: "")
    }

    struct NewPayment {
        static var title = NSLocalizedString("newPayment.title", comment: "")
        static var toAccount = NSLocalizedString("newPayment.toAccount", comment: "")
        static var bankCode = NSLocalizedString("newPayment.bankCode", comment: "")
        static var amount = NSLocalizedString("newPayment.amount", comment: "")
        static var pay = NSLocalizedString("newPayment.pay", comment: "")
    }

    struct TransactionHistory {
        static var title = NSLocalizedString("transactionHistory.title", comment: "")
    }
    
}
