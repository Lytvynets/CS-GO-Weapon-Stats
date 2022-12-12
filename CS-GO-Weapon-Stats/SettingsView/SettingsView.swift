//
//  SettingsView.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 20.11.2022.
//

import Foundation
import UIKit

extension MainScreenViewController {
    
    func setupSettingsView() {
        view.addSubview(settingView)
        settingView.addSubview(closeSettingButton)
        settingView.addSubview(addIdButton)
        settingView.addSubview(donationButton)
        settingView.addSubview(watchAdsButton)
        settingView.addSubview(tutorialButton)
        fontSettings()
        setConstraints()
        fontSettingsView()
        setShadowsSettingsView()
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            addIdButton.topAnchor.constraint(equalTo: settingView.safeAreaLayoutGuide.topAnchor, constant: view.frame.height / 10),
            addIdButton.leadingAnchor.constraint(equalTo: settingView.leadingAnchor, constant: 25),
            addIdButton.heightAnchor.constraint(equalTo: settingView.heightAnchor, multiplier: 1/20),
            closeSettingButton.topAnchor.constraint(equalTo: settingView.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeSettingButton.trailingAnchor.constraint(equalTo: settingView.trailingAnchor, constant: -16),
            tutorialButton.topAnchor.constraint(equalTo: addIdButton.bottomAnchor, constant: 25),
            tutorialButton.leadingAnchor.constraint(equalTo: settingView.leadingAnchor, constant: 25),
            tutorialButton.heightAnchor.constraint(equalTo: settingView.heightAnchor, multiplier: 1/20),
            donationButton.topAnchor.constraint(equalTo: tutorialButton.bottomAnchor, constant: 25),
            donationButton.leadingAnchor.constraint(equalTo: settingView.leadingAnchor, constant: 25),
            donationButton.heightAnchor.constraint(equalTo: settingView.heightAnchor, multiplier: 1/20),
            watchAdsButton.topAnchor.constraint(equalTo: donationButton.bottomAnchor, constant: 25),
            watchAdsButton.leadingAnchor.constraint(equalTo: settingView.leadingAnchor, constant: 25),
            watchAdsButton.heightAnchor.constraint(equalTo: settingView.heightAnchor, multiplier: 1/20),
            settingView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            settingView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            settingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -290),
            settingView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            settingView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/1),
        ])
    }
    
    
    func fontSettingsView() {
        addIdButton.titleLabel?.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.025)
        donationButton.titleLabel?.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.025)
        watchAdsButton.titleLabel?.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.025)
        tutorialButton.titleLabel?.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.025)
    }
    
    
    func setShadowsSettingsView() {
        customizeShadow.makeShadowForOne(object: settingView,
                                         borderWidth: nil,
                                         borderColor: nil,
                                         shadowColor: UIColor.black.cgColor,
                                         shadowRadius: 15,
                                         Opacity: 0.3)
      
        
        customizeShadow.makeShadowForAll(object: [tutorialButton, watchAdsButton, donationButton, addIdButton, closeSettingButton ],
                                         borderWidth: nil,
                                         borderColor: nil,
                                         shadowColor: UIColor.black.cgColor,
                                         shadowRadius: 5,
                                         Opacity: 0.5)
        
    }
}
