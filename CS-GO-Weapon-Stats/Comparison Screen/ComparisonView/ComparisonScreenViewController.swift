//
//  ComparisonScreenViewController.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 20.11.2022.
//

import Foundation
import UIKit

class ComparisonScreenViewController: UIViewController, UITextFieldDelegate {
    
    var infoView = InfoViewComparisonScreen()
    var customizeShadow = CustomizeShadows()
    var networkManager = NetworkManager()
    var variables = Variables()
    var buttonColor = #colorLiteral(red: 0.9992486835, green: 0.7128490806, blue: 0.0003235559561, alpha: 1)
    
    lazy var steamTextField = TextFieldBuilder(textPlaceholder: "", fontSize: 12)
    lazy var steamTextField2 = TextFieldBuilder(textPlaceholder: "", fontSize: 12)
    lazy var nameWeaponLabel = LabelBuilder(fontSize: 23, startText: "Weapon", color: .white)
    
    
    //MARK: - buttons
    lazy var okButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ok", for: .normal)
        button.setTitleColor(buttonColor, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1072011217, green: 0.1075766459, blue: 0.1186723337, alpha: 1)
        button.layer.cornerRadius = view.frame.height * 0.016
        button.addTarget(self, action: #selector(push), for: .touchUpInside)
        return button
    }()
    
    lazy var pickWeaponButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pick weapon", for: .normal)
        button.setTitleColor(buttonColor, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1072011217, green: 0.1075766459, blue: 0.1186723337, alpha: 1)
        button.layer.cornerRadius = view.frame.height * 0.016
        button.addTarget(self, action: #selector(pickWeapon), for: .touchUpInside)
        return button
    }()
    
    lazy var pickIdButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "repeat"), for: .normal)
        button.tintColor = buttonColor
        button.setTitleColor(buttonColor, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1072011217, green: 0.1075766459, blue: 0.1186723337, alpha: 1)
        button.layer.cornerRadius = view.frame.height * 0.016
        button.addTarget(self, action: #selector(pickId), for: .touchUpInside)
        return button
    }()
    
    var weaponImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "photo.fill")
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        steamTextField.attributedPlaceholder = NSAttributedString(
            string: "Steam Id 1 player", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        steamTextField2.attributedPlaceholder = NSAttributedString(
            string: "Steam Id 2 player", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        setup()
        keyboardObserver()
        textFieldSettings()
    }
    
    
    //MARK: - work with text field
    func textFieldSettings() {
        steamTextField.delegate = self
        steamTextField2.delegate = self
        steamTextField.layer.cornerRadius = view.frame.height * 0.016
        steamTextField2.layer.cornerRadius = view.frame.height * 0.016
    }
    
    func keyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height / 2.5
                self.weaponImage.isHidden = true
                self.nameWeaponLabel.isHidden = true
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
            self.weaponImage.isHidden = false
            self.nameWeaponLabel.isHidden = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func defineLabelColor(){
        guard let shots1 = Int(self.infoView.shotInfoLabel.text ?? "") else { return }
        guard let shots2 = Int(self.infoView.shotInfoLabel2.text ?? "") else { return }
        guard let hit1 = Int(self.infoView.hitInfoLabel.text ?? "") else { return }
        guard let hit2 = Int(self.infoView.hitInfoLabel2.text ?? "") else { return }
        guard let kills1 = Int(self.infoView.killInfoLabel.text ?? "" ) else { return }
        guard let kills2 = Int(self.infoView.killInfoLabel2.text ?? "" ) else { return }
        
        if shots1 > shots2 {
            self.infoView.shotInfoLabel.textColor = .green
            self.infoView.shotInfoLabel2.textColor = .red
        } else if shots2 > shots1 {
            self.infoView.shotInfoLabel.textColor = .red
            self.infoView.shotInfoLabel2.textColor = .green
        }
        
        if hit1 > hit2 {
            self.infoView.hitInfoLabel.textColor = .green
            self.infoView.hitInfoLabel2.textColor = .red
        } else if hit2 > hit1 {
            self.infoView.hitInfoLabel.textColor = .red
            self.infoView.hitInfoLabel2.textColor = .green
        }
        
        if kills1 > kills2 {
            self.infoView.killInfoLabel.textColor = .green
            self.infoView.killInfoLabel2.textColor = .red
        } else if kills2 > kills1 {
            self.infoView.killInfoLabel.textColor = .red
            self.infoView.killInfoLabel2.textColor = .green
        }
    }
}


//MARK: - FirstViewControllerDelegate
extension ComparisonScreenViewController: PickSteamIdDelegate {
    func fillTextField(text: String) {
        if self.steamTextField.text == "" {
            self.steamTextField.text = text
        }else{
            self.steamTextField2.text = text
        }
    }
}
