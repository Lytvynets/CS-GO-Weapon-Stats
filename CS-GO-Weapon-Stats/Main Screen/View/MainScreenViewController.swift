//
//  MainScreenViewController.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 20.11.2022.
//

import UIKit
import Foundation

class MainScreenViewController: UIViewController {
    
    var variables = Variables()
    var networkManager = NetworkManager()
    var infoView = InfoView()
    var customizeShadow = CustomizeShadows()
    var rewardedAdHelper = RewardedAdHelper()
    var settingsViewIsOpen = false
    var buttonColor = #colorLiteral(red: 0.9992486835, green: 0.7128490806, blue: 0.0003235559561, alpha: 1)
    var dataManager = DataManager()
    let router: MainRouter = Router.shared
    var lastOperation = SavedSessionsModel(id: "", indexWeapon: 0, weapon: "", shots: "", hits: "", kills: "", dateOperation: "")
    
    lazy var nameWeaponLabel = LabelBuilder(fontSize: 23, startText: "Weapon", color: .white)
    lazy var steamIdTextField = TextFieldBuilder(textPlaceholder: "", fontSize: 17)
    lazy var descriptionSupport = LabelBuilder(fontSize: 15, startText: "If you want to support the project, \n you can watch the advertisement", color: .gray)
    
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
        button.tintColor = buttonColor
        button.backgroundImage(for: .normal)
        button.addTarget(self, action: #selector(openSettings), for: .touchUpInside)
        return button
    }()
    
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
    
    lazy var saveSessionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save session", for: .normal)
        button.setTitleColor(buttonColor, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1072011217, green: 0.1075766459, blue: 0.1186723337, alpha: 1)
        button.layer.cornerRadius = view.frame.height * 0.016
        button.addTarget(self, action: #selector(saveSession), for: .touchUpInside)
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
        button.setTitle("  Tutorial                   ", for: .normal)
        button.setImage(UIImage(systemName: "book.closed"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = buttonColor
        button.addTarget(self, action: #selector(tutorial), for: .touchUpInside)
        return button
    }()
    
    lazy var addIdButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("  Save player            ", for: .normal)
        button.setImage(UIImage(systemName: "cloud"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = buttonColor
        button.addTarget(self, action: #selector(addId), for: .touchUpInside)
        return button
    }()
    
    lazy var watchAdsButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("  Watch ads                   ", for: .normal)
        button.setImage(UIImage(systemName: "play"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = buttonColor
        button.addTarget(self, action: #selector(watchAds), for: .touchUpInside)
        return button
    }()
    
    lazy var closeSettingButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = buttonColor
        button.addTarget(self, action: #selector(closeSettings), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - Blur view
    lazy var blurView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //MARK: - View Did load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        setup()
        steamIdTextField.attributedPlaceholder = NSAttributedString(
            string: "Enter Steam Id here", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        textFieldSettings()
        rewardedAdHelper.loadRewardedAd()
        keyboardObserver()
        swipeGestures()
        descriptionSupport.numberOfLines = 0
       
    }
    
    
    //MARK: - View Will layout subviews
    override func viewWillLayoutSubviews() {
        changeButtonState()
        blurView.alpha = 0
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func saveLastOperation(){
        let id = steamIdTextField.text ?? ""
        let indexWeapon = Variables.indexRow
        let weapon = nameWeaponLabel.text ?? ""
        let shots = infoView.shotInfoLabel.text ?? ""
        let hits = infoView.hitInfoLabel.text ?? ""
        let kills = infoView.killInfoLabel.text ?? ""
        let now = Date()
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        let dateTime = dateFormater.string(from: now)
        lastOperation = SavedSessionsModel(id: id, indexWeapon: indexWeapon, weapon: weapon, shots: "\(shots)", hits: "\(hits)", kills: "\(kills)", dateOperation: dateTime)
        dataManager.saveSession(session: lastOperation)
    }
    
    
    //MARK: - Work with gestures
    private func swipeGestures() {
        let swipeGestureRecognizerLeft = UISwipeGestureRecognizer(target: self, action: #selector(closeSettingsView(_:)))
        swipeGestureRecognizerLeft.direction = .left
        settingView.addGestureRecognizer(swipeGestureRecognizerLeft)
        let swipeGestureRecognizerRight = UISwipeGestureRecognizer(target: self, action: #selector(openSettingsView(_:)))
        swipeGestureRecognizerRight.direction = .right
        view.addGestureRecognizer(swipeGestureRecognizerRight)
    }
    
    
    @objc private func closeSettingsView(_ sender: UISwipeGestureRecognizer) {
        if settingsViewIsOpen == true {
            UIView.animate(withDuration: 0.6) {
                self.settingView.frame = self.settingView.frame.offsetBy(dx: -290, dy: 0)
                self.settingButton.rotate(said: 2.0, duration: 0.6)
                self.closeSettingButton.rotate(said: 2.0, duration: 0.6)
                self.settingButton.alpha = 1
                self.blurView.alpha = 0
                self.settingsViewIsOpen = false
            }
        }
    }
    
    
    @objc private func openSettingsView(_ sender: UISwipeGestureRecognizer) {
        if settingsViewIsOpen == false {
            UIView.animate(withDuration: 0.6) {
                self.settingView.frame = self.settingView.frame.offsetBy(dx: 290, dy: 0)
                self.settingButton.rotate(said: -2.0, duration: 0.6)
                self.closeSettingButton.rotate(said: -2.0, duration: 0.6)
                self.settingButton.alpha = 0
                self.blurView.alpha = 1
                self.settingsViewIsOpen = true
            }
        }
    }
    
    
    private func textFieldSettings() {
        steamIdTextField.delegate = self
        steamIdTextField.layer.cornerRadius = view.frame.height * 0.016
    }
    
    
    private func keyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
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
}
