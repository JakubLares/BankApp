//
//  Image.swift
//  Fio
//
//  Created by Jakub Lares on 11.07.2021.
//

import UIKit

enum Images {

    case accounts

    func image() -> UIImage? {
        switch self {
        case .accounts:
            return UIImage(systemName: "list.bullet")
        }
    }

}
