//
//  Actions.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 20.11.2022.
//

import Foundation
import UIKit
import AudioToolbox

extension MainScreenViewController {
    
    //MARK: Settings Buttons
    @objc func openSettings(){
        UIView.animate(withDuration: 0.8) {
            self.settingView.frame = self.settingView.frame.offsetBy(dx: 290, dy: 0)
            self.settingButton.rotate(said: -2.0, duration: 0.8)
            self.settingButton.alpha = 0
            self.state = true
        }
       // let sceneDelegate = SceneDelegate()
        //sceneDelegate.delegate = self
    }
    
    @objc func closeSettings(){
        UIView.animate(withDuration: 0.8) {
            self.settingView.frame = self.settingView.frame.offsetBy(dx: -290, dy: 0)
            self.settingButton.rotate(said: 2.0, duration: 0.8)
            self.closeSettingButton.rotate(said: 2.0, duration: 0.8)
            self.settingButton.alpha = 1
            self.state = false
        }
    }
    
    @objc func addId() {
        let vc2 = SaveSteamID()
        vc2.title = "Save Steam ID"
        vc2.delegate = self
        let navCon = UINavigationController(rootViewController: vc2)
        present(navCon, animated: true, completion: nil)
    }
    
    @objc func tutorial() {
        let vc2 = TutorialScreen()
        vc2.title = "Tutorial"
        let navCon = UINavigationController(rootViewController: vc2)
        present(navCon, animated: true, completion: nil)
    }
    
    @objc func supportProject() {
        let vc2 = DonationScreen()
        vc2.delegate = self
        vc2.title = "Support Project"
        let navCon = UINavigationController(rootViewController: vc2)
        present(navCon, animated: true, completion: nil)
    }
    
    
    @objc func pickId() {
        let vc2 = SteamIdList()
        vc2.delegate = self
        vc2.title = "Steam id list"
        let navCon = UINavigationController(rootViewController: vc2)
        present(navCon, animated: true, completion: nil)
    }
    
    @objc func pickWeapon(){
        let vc2 = WeaponTableViewController()
        vc2.title = "Pick weapon"
        present(vc2, animated: true, completion: nil)
    }
    
    @objc func watchAds(){
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        rewardedAdHelper.showRewardedAd(viewController: self)
    }
    
    //MARK: - Networking
    @objc func push(){
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        guard sampleTextField.text != nil else { return }
        networkManager.returnError = { error in
            DispatchQueue.main.async {
                self.nameWeaponLabel.text = "Error: \(error.localizedDescription)"
                self.nameWeaponLabel.textColor = .red
                self.nameWeaponLabel.font = UIFont.systemFont(ofSize: 11)
                self.infoView.activityIndicator.isHidden = true
                self.infoView.activityIndicator.stopAnimating()
                
            }
        }
        variables.idSteam = sampleTextField.text
        self.infoView.activityIndicator.isHidden = false
        self.infoView.activityIndicator.startAnimating()
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
                self.infoView.activityIndicator.isHidden = true
                self.infoView.activityIndicator.stopAnimating()
            }
        }
    }
}
