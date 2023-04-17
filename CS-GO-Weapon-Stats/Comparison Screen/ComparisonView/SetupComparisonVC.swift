//
//  SetupComparisonVC.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 20.11.2022.
//

import Foundation
import UIKit

extension ComparisonScreenViewController {
    func setup() {
        view.addSubview(nameWeaponLabel)
        view.addSubview(okButton)
        view.addSubview(weaponImage)
        view.addSubview(steamTextField)
        view.addSubview(steamTextField2)
        view.addSubview(pickWeaponButton)
        view.addSubview(pickIdButton)
        view.addSubview(infoView)
        
        fontSettings()
        setupInfoView()
        setupButtons()
        setupTextFields()
        setupWeaponImage()
        setNameLabel()
        setShadows()
    }
    
    
    func setShadows() {
        customizeShadow.makeShadowForAll(object: [nameWeaponLabel, okButton, steamTextField, steamTextField2, pickWeaponButton, pickIdButton ],
                                         borderWidth: nil,
                                         borderColor: nil,
                                         shadowColor: UIColor.black.cgColor,
                                         shadowRadius: 5,
                                         Opacity: 0.5)
        
        
        customizeShadow.makeShadowForOne(object: weaponImage,
                                         borderWidth: nil,
                                         borderColor: nil,
                                         shadowColor: UIColor.red.cgColor,
                                         shadowRadius: 5,
                                         Opacity: 0.7)
        
    }
    
    
    func setNameLabel() {
        NSLayoutConstraint.activate([
            nameWeaponLabel.topAnchor.constraint(equalTo: weaponImage.bottomAnchor, constant: 10),
            nameWeaponLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    
    func setupWeaponImage() {
        NSLayoutConstraint.activate([
            weaponImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weaponImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            weaponImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3),
            weaponImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/11)
        ])
    }
    
    
    func setupTextFields() {
        NSLayoutConstraint.activate([
            steamTextField.topAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 25),
            steamTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            steamTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2.3),
            steamTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/19),
            steamTextField2.topAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 25),
            steamTextField2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            steamTextField2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2.3),
            steamTextField2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/19),
        ])
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
            okButton.topAnchor.constraint(equalTo: pickWeaponButton.bottomAnchor, constant: 15),
            okButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            okButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.5),
            okButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/19),
            pickWeaponButton.topAnchor.constraint(equalTo: steamTextField.bottomAnchor, constant: 15),
            pickWeaponButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            pickWeaponButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2.3),
            pickWeaponButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/19),
            pickIdButton.topAnchor.constraint(equalTo: steamTextField.bottomAnchor, constant: 15),
            pickIdButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            pickIdButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2.3),
            pickIdButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/19)
        ])
    }
    
    
    func fontSettings() {
        nameWeaponLabel.font = UIFont(name: "Chalkboard SE Regular", size: view.frame.height * 0.025)
        infoView.shotLabel.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.025)
        infoView.shotInfoLabel.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.023)
        infoView.shotInfoLabel2.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.023)
        infoView.hitLabel.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.025)
        infoView.hitInfoLabel.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.023)
        infoView.hitInfoLabel2.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.023)
        infoView.killLabel.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.025)
        infoView.killInfoLabel.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.023)
        infoView.killInfoLabel2.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.023)
        okButton.titleLabel?.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.023)
        pickWeaponButton.titleLabel?.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.023)
        steamTextField.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.02)
        steamTextField2.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.02)
    }
}
