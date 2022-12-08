//
//  MainRouter.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 28.11.2022.
//

import UIKit

extension Router: MainRouter {
    
    func showPickWeaponScreen(from viewController: UIViewController) {
        let vc2 = WeaponTableViewController()
        vc2.title = "Pick weapon"
        viewController.present(vc2, animated: true, completion: nil)
    }
    
    func showDonationScreen(from viewController: UIViewController) {
        let vc2 = DonationScreen()
        vc2.title = "Support Project"
        let navCon = UINavigationController(rootViewController: vc2)
        viewController.present(navCon, animated: true, completion: nil)
    }
    
    func showTutorialScreen(from viewController: UIViewController) {
        let vc2 = TutorialScreen()
        vc2.title = "Tutorial"
        let navCon = UINavigationController(rootViewController: vc2)
        viewController.present(navCon, animated: true, completion: nil)
    }
    
    func showSaveIdScreen(from viewController: UIViewController) {
        let vc2 = SaveSteamID()
        vc2.title = "Save Steam ID"
        let navCon = UINavigationController(rootViewController: vc2)
        viewController.present(navCon, animated: true, completion: nil)
    }
}
