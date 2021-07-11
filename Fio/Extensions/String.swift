//
//  File.swift
//  Fio
//
//  Created by Jakub Lares on 11.07.2021.
//

import Foundation

extension String {

    func validate(regexString: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: regexString) else { return false }
        let range = NSRange(location: 0, length: utf16.count)
        return regex.firstMatch(in: self, options: [], range: range) != nil
    }

}
