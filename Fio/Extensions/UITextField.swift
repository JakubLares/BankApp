//
//  UITextField.swift
//  Fio
//
//  Created by Jakub Lares on 11.07.2021.
//

import UIKit
import Combine

extension UITextField {

    func unwrappedText() -> String {
        return text ?? ""
    }

    func textPublisher() -> AnyPublisher<UITextField?, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .map { notification in
                notification.object as? UITextField
            }
            .eraseToAnyPublisher()
    }

}
