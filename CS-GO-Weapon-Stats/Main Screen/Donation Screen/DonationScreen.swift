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
    var delegate: StateViewControllerDelegate?
    
    lazy var donatePayButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("DonatePay", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1072011217, green: 0.1075766459, blue: 0.1186723337, alpha: 1)
        button.layer.cornerRadius = view.frame.height * 0.016
        button.addTarget(self, action: #selector(donatePay), for: .touchUpInside)
        return button
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
    
    
    @objc func donatePay() {
        UIApplication.shared.open(url! , options: [:], completionHandler: nil)
        delegate?.changeState()
    }
    
    
    func setup() {
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.addSubview(donatePayButton)
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            donatePayButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            donatePayButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            donatePayButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.3),
            donatePayButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/22),
        ])
    }
    
    
    func fontSettings() {
        donatePayButton.titleLabel?.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.02)
    }
    
    
    func setShadows() {
        customizeShadow.makeShadow(object: donatePayButton,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.5)
        
    }
}
