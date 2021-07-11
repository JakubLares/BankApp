//
//  TableViewCells.swift
//  Fio
//
//  Created by Jakub Lares on 11.07.2021.
//

import UIKit

class TableViewCells {

    static let accounts = "AccountsTableViewCell"

}

extension UITableView {

    func register(cell: String) {
        register(UINib(nibName: cell, bundle: nil), forCellReuseIdentifier: cell)
    }

}
