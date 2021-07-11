//
//  APIClient.swift
//  Fio
//
//  Created by Jakub Lares on 11.07.2021.
//

import Foundation
import Combine

class APIClient {

    private enum Endpoint: String {
        case accounts = "accounts.json"
    }

    static let shared = APIClient()
    private static var baseURL = "http://kali.fio.cz/test/"

    lazy private var jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        return jsonDecoder
    }()

    func getAccounts() -> AnyPublisher<AccountsResponse, Error> {
        return URLSession.shared.dataTaskPublisher(for: APIClient.createURL(endpoint: .accounts))
            .map { $0.data }
            .decode(type: AccountsResponse.self, decoder: jsonDecoder)
            .eraseToAnyPublisher()
    }

    private static func createURL(endpoint: Endpoint) -> URL {
        guard let url = URL(string: baseURL + endpoint.rawValue) else { fatalError("URL not created") }
        return url
    }

}
