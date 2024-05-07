//
//  TabBarViewController.swift
//  Mapa Solidario
//
//  Created by Rodrigo Henrique Torres Cavalcanti on 05/05/24.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let maps = MapsViewController()
        let menu = MenuViewController()

        self.tabBar.backgroundColor = UIColor(red: 0.925, green: 0.992, blue: 0.965, alpha: 1.0) // #ECFDF6
        maps.tabBarItem = UITabBarItem(
            title: "Mapa",
            image: UIImage.map,
            selectedImage: nil
        )

        menu.tabBarItem = UITabBarItem(
            title: "Cadastrar local",
            image: UIImage.pin,
            selectedImage: nil
        )

        viewControllers = [maps, menu]
    }
}

