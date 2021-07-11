//
//  Payment.swift
//  Fio
//
//  Created by Jakub Lares on 12.07.2021.
//

struct Payment: Codable {

    let toAccount: Int
    let bankCode: Int
    let amount: Double

}
