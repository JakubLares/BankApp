//
//  FileClient.swift
//  Fio
//
//  Created by Jakub Lares on 12.07.2021.
//

import Foundation

class FileClient {

    static let shared = FileClient()
    private var fileName = "payments.json"

    lazy private var jsonEncoder: JSONEncoder = {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        return jsonEncoder
    }()

    lazy private var jsonDecoder: JSONDecoder = {
        let jsonEncoder = JSONDecoder()
        return jsonEncoder
    }()

    func savePayment(_ payment: Payment) {
        var payments = loadPayments()
        payments.append(payment)
        guard
            let data = try? jsonEncoder.encode(payments),
            let dataString = String(data: data, encoding: .utf8),
            let paymentsURL = getPaymentsURL()
        else {
            return
        }

        try? dataString.write(to: paymentsURL, atomically: true, encoding: .utf8)
    }

    func loadPayments() -> [Payment] {
        guard
            let paymentsURL = getPaymentsURL(),
            let paymentsData = try? String(contentsOf: paymentsURL, encoding: .utf8).data(using: .utf8),
            let payments = try? jsonDecoder.decode([Payment].self, from: paymentsData)
        else {
            return []
        }

        return payments
    }

    private func getPaymentsURL() -> URL? {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(fileName)
    }

}
