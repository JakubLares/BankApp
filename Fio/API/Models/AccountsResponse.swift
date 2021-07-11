//
//  AccountsResponse.swift
//  Fio
//
//  Created by Jakub Lares on 11.07.2021.
//

import Foundation

struct AccountsResponse: Codable {

    struct Account: Codable {
        let name: String
        let number: Int
        let currency: String
        let balance: Double
    }

    let accounts: [Account]
}
