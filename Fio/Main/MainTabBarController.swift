//
//  MainTabBarController.swift
//  Fio
//
//  Created by Jakub Lares on 11.07.2021.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let accountsTableViewController = StoryboardScene.accounts else { return }

        let accountsItem = UITabBarItem(title: LocalizableStrings.accounts, image: Images.accounts.image(), selectedImage: nil)
        let accountsNavigationController = UINavigationController(rootViewController: accountsTableViewController)
        accountsNavigationController.tabBarItem = accountsItem

        viewControllers = [accountsNavigationController]
    }

    override func viewDidLoad() {
        tabBar.barTintColor = .white
    }

}
