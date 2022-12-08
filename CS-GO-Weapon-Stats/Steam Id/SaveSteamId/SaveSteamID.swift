//
//  SaveSteamID.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 20.11.2022.
//

import Foundation
import UIKit

class SaveSteamID: UIViewController, UITextFieldDelegate {
    
    var customizeShadow = CustomizeShadows()
    var player = ModelSteamID(name: "", id: "")
    var dataManager = DataManager()
    var delegate: StateSettingsButtonDelegate?
    var buttonColor = #colorLiteral(red: 0.9992486835, green: 0.7128490806, blue: 0.0003235559561, alpha: 1)
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var steamIdLabel: UILabel = {
        let label = UILabel()
        label.text = "Steam Id"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let sampleTextField = UITextField()
        sampleTextField.placeholder = "Name"
        sampleTextField.borderStyle = .none
        sampleTextField.contentMode = .center
        sampleTextField.textAlignment = .center
        sampleTextField.textColor = .white
        sampleTextField.backgroundColor = #colorLiteral(red: 0.1072011217, green: 0.1075766459, blue: 0.1186723337, alpha: 1)
        sampleTextField.font = UIFont.systemFont(ofSize: 17)
        sampleTextField.keyboardType = UIKeyboardType.default
        sampleTextField.returnKeyType = UIReturnKeyType.done
        sampleTextField.translatesAutoresizingMaskIntoConstraints = false
        sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return sampleTextField
    }()
    
    lazy var steamIdTextField: UITextField = {
        let sampleTextField = UITextField()
        sampleTextField.placeholder = "Steam Id"
        sampleTextField.borderStyle = .none
        sampleTextField.contentMode = .center
        sampleTextField.textAlignment = .center
        sampleTextField.textColor = .white
        sampleTextField.backgroundColor = #colorLiteral(red: 0.1072011217, green: 0.1075766459, blue: 0.1186723337, alpha: 1)
        sampleTextField.font = UIFont.systemFont(ofSize: 17)
        sampleTextField.keyboardType = UIKeyboardType.default
        sampleTextField.returnKeyType = UIReturnKeyType.done
        sampleTextField.translatesAutoresizingMaskIntoConstraints = false
        sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return sampleTextField
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1072011217, green: 0.1075766459, blue: 0.1186723337, alpha: 1)
        button.layer.cornerRadius = view.frame.height * 0.016
        button.addTarget(self, action: #selector(push), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.1090728668, green: 0.1187008762, blue: 0.1334001901, alpha: 1)
        setup()
        steConstraints()
        fontSettings()
        setShadows()
        
        steamIdTextField.delegate = self
        steamIdTextField.layer.cornerRadius = view.frame.height * 0.016
      
        nameTextField.layer.cornerRadius = view.frame.height * 0.016
        nameTextField.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.02)
        steamIdTextField.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.02)
        saveButton.titleLabel?.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.02)
        nameLabel.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.015)
        steamIdLabel.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.015)
        
        if steamIdTextField.text?.isEmpty == true {
            saveButton.isUserInteractionEnabled = false
            saveButton.titleLabel?.textColor = .red
        }
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isUserInteractionEnabled = true
        saveButton.titleLabel?.textColor = buttonColor
    }
    
    
    func setup() {
        view.addSubview(nameLabel)
        view.addSubview(steamIdLabel)
        view.addSubview(nameTextField)
        view.addSubview(steamIdTextField)
        view.addSubview(saveButton)
    }
    
    
    func steConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.2),
            nameTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/20),
            steamIdLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            steamIdLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            steamIdTextField.topAnchor.constraint(equalTo: steamIdLabel.bottomAnchor, constant: 5),
            steamIdTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            steamIdTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.2),
            steamIdTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/20),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.topAnchor.constraint(equalTo: steamIdTextField.bottomAnchor, constant: 45),
            saveButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2),
            saveButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/20)
        ])
    }
    
    
    func fontSettings() {
        saveButton.titleLabel?.font = UIFont(name: "Arial", size: view.frame.height * 0.02)
        nameLabel.font = UIFont.boldSystemFont(ofSize: view.frame.height * 0.018)
        steamIdLabel.font = UIFont.boldSystemFont(ofSize: view.frame.height * 0.018)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    func setShadows() {
        customizeShadow.makeShadow(object: nameLabel,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: steamIdLabel,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: nameTextField,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: steamIdTextField,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: saveButton,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.5)
    }
    
    
    @objc func push() {
        let name = steamIdTextField.text ?? ""
        let id = nameTextField.text ?? ""
        self.player = ModelSteamID(name: name, id: id)
        dataManager.saveId(id: player)
        delegate?.changeButtonState()
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        dismiss(animated: true, completion: nil)
    }
}
