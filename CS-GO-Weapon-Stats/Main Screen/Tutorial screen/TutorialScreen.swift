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
    
    lazy var steamIdLabel: UILabel = {
        let label = UILabel()
        label.text = "How get steam id?"
        label.font = .systemFont(ofSize: 23)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var Label1: UILabel = {
        let label = UILabel()
        label.text = "1. Open profile steam"
        label.font = .systemFont(ofSize: 23)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var Label2: UILabel = {
        let label = UILabel()
        label.text = "2. Copy after: /id/... "
        label.font = .systemFont(ofSize: 23)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var steamIdImage: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "steam_id")
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var Label3: UILabel = {
        let label = UILabel()
        label.text = "3. Paste the steam id into the text field"
        label.font = .systemFont(ofSize: 23)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var Label4: UILabel = {
        let label = UILabel()
        label.text = "4. Press the 'OK' button"
        label.font = .systemFont(ofSize: 23)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        customizeShadow.makeShadow(object: steamIdLabel,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: steamIdImage,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: Label1,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: Label2,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.5)
    }
}
