//
//  SetupMainVC.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 20.11.2022.
//

import Foundation
import UIKit

extension MainScreenViewController {
    
    //MARK: - Setup
    func setup() {
        view.addSubview(nameWeaponLabel)
        view.addSubview(okButton)
        view.addSubview(weaponImage)
        view.addSubview(sampleTextField)
        view.addSubview(pickWeaponButton)
        view.addSubview(pickIdButton)
        view.addSubview(settingButton)
        view.addSubview(infoView)
        
        setupSettingsView()
        setupInfoView()
        fontSettings()
        setupButtons()
        setShadows()
        weaponImageLayout()
        settingsButtonLayout()
        nameLabelButtonLayout()
        textFieldButtonLayout()
    }
    
    
    func weaponImageLayout() {
        NSLayoutConstraint.activate([
            weaponImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weaponImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            weaponImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3),
            weaponImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/11),
        ])
        
    }
    
    
    func settingsButtonLayout() {
        NSLayoutConstraint.activate([
            settingButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            settingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    
    
    func nameLabelButtonLayout() {
        NSLayoutConstraint.activate([
            nameWeaponLabel.topAnchor.constraint(equalTo: weaponImage.bottomAnchor, constant: 10),
            nameWeaponLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    
    func textFieldButtonLayout() {
        NSLayoutConstraint.activate([
            sampleTextField.topAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 25),
            sampleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sampleTextField.trailingAnchor.constraint(equalTo: pickIdButton.leadingAnchor, constant: -5),
            sampleTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/23),
        ])
    }
    
    
    func setShadows() {
        customizeShadow.makeShadow(object: pickIdButton,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: pickWeaponButton,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: okButton,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: settingButton,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: sampleTextField,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: nameWeaponLabel,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.7)
        
        customizeShadow.makeShadow(object: weaponImage,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.red.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.7)
    }
    
    
    func fontSettings() {
        nameWeaponLabel.font = UIFont(name: "Chalkboard SE Regular", size: view.frame.height * 0.025)
        infoView.shotLabel.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.025)
        infoView.shotInfoLabel.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.023)
        infoView.hitLabel.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.025)
        infoView.hitInfoLabel.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.023)
        infoView.killLabel.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.025)
        infoView.killInfoLabel.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.023)
        okButton.titleLabel?.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.02)
        pickWeaponButton.titleLabel?.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.02)
        sampleTextField.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.02)
    }
    
    
    func setupInfoView() {
        NSLayoutConstraint.activate([
            infoView.topAnchor.constraint(equalTo: nameWeaponLabel.bottomAnchor, constant: 15),
            infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            infoView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/5),
        ])
    }
    
    
    func setupButtons() {
        NSLayoutConstraint.activate([
            pickWeaponButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pickWeaponButton.topAnchor.constraint(equalTo: sampleTextField.bottomAnchor, constant: 15),
            pickWeaponButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2),
            pickWeaponButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/23),
            pickIdButton.topAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 25),
            pickIdButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pickIdButton.leadingAnchor.constraint(equalTo: sampleTextField.trailingAnchor, constant: 5),
            pickIdButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/10),
            pickIdButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/23),
            okButton.topAnchor.constraint(equalTo: pickWeaponButton.bottomAnchor, constant: 15),
            okButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            okButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2),
            okButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/23)
        ])
    }
}
