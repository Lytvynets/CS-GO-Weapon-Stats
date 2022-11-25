//
//  MainScreenViewController.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 20.11.2022.
//

import UIKit
import Foundation

class MainScreenViewController: UIViewController, UITextFieldDelegate, UNUserNotificationCenterDelegate, StateViewControllerDelegate{
    
    var variables = Variables()
    var networkManager = NetworkManager()
    var infoView = InfoView()
    var customizeShadow = CustomizeShadows()
    var donationScreen = DonationScreen()
    var state = false
    
    
    //MARK: - Image view
    lazy var weaponImage: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "photo.fill")
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    //MARK: - Buttons
    lazy var settingButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        button.tintColor = .orange
        button.backgroundImage(for: .normal)
        button.addTarget(self, action: #selector(openSettings), for: .touchUpInside)
        return button
    }()
    
    lazy var okButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ok", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1072011217, green: 0.1075766459, blue: 0.1186723337, alpha: 1)
        button.layer.cornerRadius = view.frame.height * 0.016
        button.addTarget(self, action: #selector(push), for: .touchUpInside)
        return button
    }()
    
    lazy var pickWeaponButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pick weapon", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1072011217, green: 0.1075766459, blue: 0.1186723337, alpha: 1)
        button.layer.cornerRadius = view.frame.height * 0.016
        button.addTarget(self, action: #selector(pickWeapon), for: .touchUpInside)
        return button
    }()
    
    lazy var pickIdButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "repeat"), for: .normal)
        button.tintColor = .orange
        button.setTitleColor(.orange, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1072011217, green: 0.1075766459, blue: 0.1186723337, alpha: 1)
        button.layer.cornerRadius = view.frame.height * 0.016
        button.addTarget(self, action: #selector(pickId), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - Setting view
    lazy var settingView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1150808851, green: 0.1233244875, blue: 0.1371310456, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var tutorialButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("  Tutorial", for: .normal)
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .orange
        button.addTarget(self, action: #selector(tutorial), for: .touchUpInside)
        return button
    }()
    
    lazy var addIdButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("  Save player", for: .normal)
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .orange
        button.addTarget(self, action: #selector(addId), for: .touchUpInside)
        return button
    }()
    
    lazy var donationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("  Support project", for: .normal)
        button.setImage(UIImage(systemName: "dollarsign"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .orange
        button.addTarget(self, action: #selector(supportProject), for: .touchUpInside)
        return button
    }()
    
    lazy var watchAdsButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("  Watch ads", for: .normal)
        button.setImage(UIImage(systemName: "play"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .orange
        button.addTarget(self, action: #selector(pickWeapon), for: .touchUpInside)
        return button
    }()
    
    lazy var closeSettingButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(closeSettings), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - Text Field
    lazy var sampleTextField: UITextField = {
        let sampleTextField =  UITextField()
        sampleTextField.placeholder = "Enter Steam Id here"
        sampleTextField.borderStyle = .none
        sampleTextField.textAlignment = .center
        sampleTextField.backgroundColor = #colorLiteral(red: 0.1072011217, green: 0.1075766459, blue: 0.1186723337, alpha: 1)
        sampleTextField.textColor = .white
        sampleTextField.font = UIFont.systemFont(ofSize: 17)
        sampleTextField.keyboardType = UIKeyboardType.default
        sampleTextField.returnKeyType = UIReturnKeyType.done
        sampleTextField.translatesAutoresizingMaskIntoConstraints = false
        sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return sampleTextField
    }()
    
    
    //MARK: - Labels
    lazy var nameWeaponLabel: UILabel = {
        let label = UILabel()
        label.text = "Weapon"
        label.font = UIFont(name: "Chalkboard SE Regular", size: 23)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    //MARK: - View Did load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        sampleTextField.delegate = self
        setup()
        sampleTextField.layer.cornerRadius = view.frame.height * 0.016
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    //MARK: - TextField delegate
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height / 2.4
                self.weaponImage.isHidden = true
                self.nameWeaponLabel.isHidden = true
                self.settingButton.isHidden = true
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
            self.weaponImage.isHidden = false
            self.nameWeaponLabel.isHidden = false
            self.settingButton.isHidden = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    
    func changeState() {
        self.settingButton.alpha = 1
        self.state = false
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        if state == true {
            UIView.animate(withDuration: 0.8) {
                self.settingView.frame = self.settingView.frame.offsetBy(dx: -290, dy: 0)
                self.settingButton.rotate(said: 2.0, duration: 0.8)
                self.closeSettingButton.rotate(said: 2.0, duration: 0.8)
                self.settingButton.alpha = 1
                self.state = false
            }
        }
    }
}


//MARK: Protocol
extension MainScreenViewController: FirstViewControllerDelegate {
    func update(text: String) {
        sampleTextField.text = text
    }
}
