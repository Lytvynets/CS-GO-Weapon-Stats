//
//  TabBarVC.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 20.11.2022.
//

import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    func setup(){
        viewControllers = [
            createNavController(rootVC: MainScreenViewController(), title: "Weapon stats", image: UIImage(systemName: "person.crop.square.fill")!),
            createNavController(rootVC: ComparisonScreenViewController(), title: "Comparison", image: UIImage(systemName: "book.fill")!)
        ]
    }
    
    
    func createNavController (rootVC: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootVC)
        navController.tabBarItem.image = image
        navController.navigationBar.barStyle = UIBarStyle.black
        navController.navigationBar.prefersLargeTitles = true
        rootVC.navigationItem.title = title
        return navController
    }
}
