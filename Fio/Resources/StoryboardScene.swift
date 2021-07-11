//
//  StoryboardScene.swift
//  Fio
//
//  Created by Jakub Lares on 11.07.2021.
//

import UIKit

class StoryboardScene {

    static var accounts: UIViewController? { StoryboardScene.initializeViewControler(name: "AccountsViewController") }
    static var paymentForm: UIViewController? { StoryboardScene.initializeViewControler(name: "NewPaymentViewController") }

    private static func initializeViewControler(name: String) -> UIViewController? {
        return UIStoryboard(name: name, bundle: nil).instantiateInitialViewController()
    }
    
}
