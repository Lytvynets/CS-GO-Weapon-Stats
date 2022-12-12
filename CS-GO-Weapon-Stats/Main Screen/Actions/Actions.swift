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
            self.blurView.alpha = 1
            self.state = true
        }
    }
    
    @objc func closeSettings(){
        UIView.animate(withDuration: 0.8) {
            self.settingView.frame = self.settingView.frame.offsetBy(dx: -290, dy: 0)
            self.settingButton.rotate(said: 2.0, duration: 0.8)
            self.closeSettingButton.rotate(said: 2.0, duration: 0.8)
            self.settingButton.alpha = 1
            self.blurView.alpha = 0
            self.state = false
        }
    }
    
    @objc func addId() {
        router.showSaveIdScreen(from: self)
    }
    
    @objc func tutorial() {
        router.showTutorialScreen(from: self)
    }
    
    @objc func supportProject() {
        router.showDonationScreen(from: self)
    }
    
    @objc func pickWeapon(){
        router.showPickWeaponScreen(from: self)
    }
    
    @objc func watchAds(){
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        rewardedAdHelper.showRewardedAd(viewController: self)
    }
    
    
    @objc func pickId() {
        let vc2 = SteamIdList()
        vc2.delegate = self
        vc2.title = "Steam id list"
        let navCon = UINavigationController(rootViewController: vc2)
        present(navCon, animated: true, completion: nil)
    }
    
    
    @objc func push(){
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        guard steamIdTextField.text != nil else { return }
        networkManager.returnError = { error in
            DispatchQueue.main.async {
                self.nameWeaponLabel.text = "Error: \(error.localizedDescription)"
                self.nameWeaponLabel.textColor = .red
                self.nameWeaponLabel.font = UIFont.systemFont(ofSize: 11)
                self.infoView.activityIndicator.isHidden = true
                self.infoView.activityIndicator.stopAnimating()
            }
        }
        variables.idSteam = steamIdTextField.text
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
