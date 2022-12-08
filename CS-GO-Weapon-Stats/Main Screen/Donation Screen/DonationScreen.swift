//
//  DonationScreen.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 20.11.2022.
//

import Foundation
import UIKit
import AudioToolbox

class DonationScreen: UIViewController {
    
    var url = URL(string: "https://donatepay.eu/don/13488")
    var customizeShadow = CustomizeShadows()
   //Will create enum with Color
    var buttonColor = #colorLiteral(red: 0.9992486835, green: 0.7128490806, blue: 0.0003235559561, alpha: 1)
    
    lazy var Label1: UILabel = {
        let label = UILabel()
        label.text = "If you want to support the project, you can leave your donations on Donate pay"
        label.font = .systemFont(ofSize: 23)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var donatePayButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("DonatePay", for: .normal)
        button.setTitleColor(buttonColor, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1072011217, green: 0.1075766459, blue: 0.1186723337, alpha: 1)
        button.layer.cornerRadius = view.frame.height * 0.016
        button.addTarget(self, action: #selector(donatePay), for: .touchUpInside)
        return button
    }()
    
    lazy var Label2: UILabel = {
        let label = UILabel()
        label.text = "You can also support the project in another way, just by viewing the ad"
        label.font = .systemFont(ofSize: 23)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var viewingAdsImage: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Ads_Image")
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.1090728668, green: 0.1187008762, blue: 0.1334001901, alpha: 1)
        setup()
        setConstraints()
        fontSettings()
        setShadows()
    }
    
    
    func setup() {
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.addSubview(donatePayButton)
        view.addSubview(Label1)
        view.addSubview(Label2)
        view.addSubview(viewingAdsImage)
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            Label1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            Label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            Label1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.2),
            Label1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/10),
            donatePayButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            donatePayButton.topAnchor.constraint(equalTo: Label1.bottomAnchor, constant: 10),
            donatePayButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.3),
            donatePayButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/18),
            Label2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            Label2.topAnchor.constraint(equalTo: donatePayButton.bottomAnchor, constant: 30),
            Label2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.2),
            Label2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/10),
            viewingAdsImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            viewingAdsImage.topAnchor.constraint(equalTo: Label2.bottomAnchor, constant: 5),
            viewingAdsImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.5),
            viewingAdsImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3.5),
        ])
    }
    
    
    func fontSettings() {
        donatePayButton.titleLabel?.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.025)
        Label1.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.02)
        Label2.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.02)
    }
    
    
    func setShadows() {
        customizeShadow.makeShadow(object: donatePayButton,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.5)
        
    }
    
    
    //MARK: - Button
    @objc func donatePay() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        UIApplication.shared.open(url! , options: [:], completionHandler: nil)
    }
}
