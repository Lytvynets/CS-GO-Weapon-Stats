//
//  TutorialScreen.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 20.11.2022.
//

import Foundation
import UIKit

class TutorialScreen: UIViewController {
    
    var customizeShadow = CustomizeShadows()
    
    lazy var steamIdLabel = LabelBuilder(fontSize: 23, startText: "How to get steam id?", color: .white)
    lazy var Label1 = LabelBuilder(fontSize: 23, startText: "1. Open profile steam", color: .white)
    lazy var Label2 = LabelBuilder(fontSize: 23, startText: "2. Copy after: /id/... ", color: .white)
    lazy var Label3 = LabelBuilder(fontSize: 23, startText: "3. Paste the steam id into the text field", color: .white)
    lazy var Label4 = LabelBuilder(fontSize: 23, startText: "4. Press the 'OK' button", color: .white)
    
    
    lazy var steamIdImage: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "steam_id")
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.1090728668, green: 0.1187008762, blue: 0.1334001901, alpha: 1)
        setup()
        setConstraints()
        fontSettings()
        setShadows()
    }
    
    
    private func setup() {
        view.addSubview(steamIdLabel)
        view.addSubview(steamIdImage)
        view.addSubview(Label1)
        view.addSubview(Label2)
        view.addSubview(Label3)
        view.addSubview(Label4)
    }
    
    
    private func fontSettings() {
        steamIdLabel.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.03)
        Label1.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.02)
        Label2.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.02)
        Label3.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.02)
        Label4.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.02)
    }
    
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            steamIdLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            steamIdLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            Label1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            Label1.topAnchor.constraint(equalTo: steamIdLabel.bottomAnchor, constant: 20),
            Label2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            Label2.topAnchor.constraint(equalTo: Label1.bottomAnchor, constant: 20),
            Label3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            Label3.topAnchor.constraint(equalTo: steamIdImage.bottomAnchor, constant: 20),
            Label4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            Label4.topAnchor.constraint(equalTo: Label3.bottomAnchor, constant: 20),
            steamIdImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            steamIdImage.topAnchor.constraint(equalTo: Label2.bottomAnchor, constant: 5),
            steamIdImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.2),
        ])
    }
    
    
    private func setShadows() {
        customizeShadow.makeShadowForAll(object: [steamIdLabel, steamIdImage, Label1, Label2],
                                         borderWidth: nil,
                                         borderColor: nil,
                                         shadowColor: UIColor.black.cgColor,
                                         shadowRadius: 5,
                                         Opacity: 0.5)
    }
}
