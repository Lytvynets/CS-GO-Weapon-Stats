//
//  ButtonsActions.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 20.11.2022.
//

import Foundation
import UIKit

extension ComparisonScreenViewController {
    
    //MARK: - Networking
    @objc func push(){
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        networkManager.returnError = { error in
            DispatchQueue.main.async {
                self.nameWeaponLabel.text = error.localizedDescription
                self.nameWeaponLabel.textColor = .red
                self.nameWeaponLabel.font = UIFont.systemFont(ofSize: 11)
                self.infoView.activityIndicator.isHidden = true
                self.infoView.activityIndicator.stopAnimating()
            }
        }
        
        
        infoView.activityIndicator.isHidden = false
        infoView.activityIndicator.startAnimating()
        variables.idSteam = sampleTextField.text
        variables.idSteamPlayer2 = sampleTextField2.text
        networkManager.getRequest(withSteamId: variables.idSteam ?? "", forIndex: Variables.indexRow ){StatsCS in
            let image = StatsCS.imageURL
            guard let imageUrl = URL(string: image) else { return }
            let urlSession = URLSession.shared
            urlSession.dataTask(with: imageUrl) { (data, response, error) in
                if let data = data, let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self.weaponImage.image = image
                    }
                }
            }.resume()
            DispatchQueue.main.async {
                self.nameWeaponLabel.font = UIFont.systemFont(ofSize: 23)
                self.nameWeaponLabel.textColor = .white
                self.nameWeaponLabel.text = StatsCS.name
                self.infoView.killInfoLabel.text = String(StatsCS.value)
                self.weaponImage.image = UIImage(contentsOfFile: image)
                self.infoView.shotInfoLabel.text = String(StatsCS.shotsFired)
                self.infoView.hitInfoLabel.text = String(StatsCS.shotsHit)
                DispatchQueue.main.async {
                    self.defineLabelColor()
                }
                self.infoView.activityIndicator.isHidden = true
                self.infoView.activityIndicator.stopAnimating()
            }
        }
        
        networkManager.getRequest(withSteamId: variables.idSteamPlayer2 ?? "", forIndex: Variables.indexRow ){StatsCS in
            let image = StatsCS.imageURL
            guard let imageUrl = URL(string: image) else { return }
            let urlSession = URLSession.shared
            urlSession.dataTask(with: imageUrl) { (data, response, error) in
            }.resume()
            DispatchQueue.main.async { [self] in
                self.infoView.killInfoLabel2.text = String(StatsCS.value)
                self.infoView.shotInfoLabel2.text = String(StatsCS.shotsFired)
                self.infoView.hitInfoLabel2.text = String(StatsCS.shotsHit)
            }
        }
    }
    
    
    @objc func pickWeapon(){
        let vc2 = WeaponTableViewController()
        present(vc2, animated: true, completion: nil)
    }
    
    
    @objc func pickId() {
        let vc2 = SteamIdList()
        vc2.delegate = self
        vc2.title = "Steam id list"
        let navCon = UINavigationController(rootViewController: vc2)
        present(navCon, animated: true, completion: nil)
    }
}
