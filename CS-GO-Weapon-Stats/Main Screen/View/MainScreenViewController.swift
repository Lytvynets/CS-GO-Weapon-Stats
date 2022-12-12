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
    var donationScreen = DonationScreen()
    var rewardedAdHelper = RewardedAdHelper()
    var state = false
    var buttonColor = #colorLiteral(red: 0.9992486835, green: 0.7128490806, blue: 0.0003235559561, alpha: 1)
    let router: MainRouter = Router.shared
    
    
    //MARK: - Labels
    lazy var nameWeaponLabel = LabelBuilder(fontSize: 23, startText: "Weapon", color: .white)
    
    
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
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = buttonColor
        button.addTarget(self, action: #selector(tutorial), for: .touchUpInside)
        return button
    }()
    
    lazy var addIdButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("  Save player            ", for: .normal)
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = buttonColor
        button.addTarget(self, action: #selector(addId), for: .touchUpInside)
        return button
    }()
    
    lazy var donationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("  Support project        ", for: .normal)
        button.setImage(UIImage(systemName: "dollarsign"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = buttonColor
        button.addTarget(self, action: #selector(supportProject), for: .touchUpInside)
        return button
    }()
    
    lazy var watchAdsButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("  Watch ads               ", for: .normal)
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
    
    
    //MARK: - Text Field
    lazy var steamIdTextField: UITextField = {
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
        
        textFieldSettings()
        rewardedAdHelper.loadRewardedAd()
        keyboardObserver()
        
        let swipeGestureRecognizerDown = UISwipeGestureRecognizer(target: self, action: #selector(closeSettingsView(_:)))
        swipeGestureRecognizerDown.direction = .left
        settingView.addGestureRecognizer(swipeGestureRecognizerDown)
        
        let swipeGestureRecognizerDown2 = UISwipeGestureRecognizer(target: self, action: #selector(openSettingsView(_:)))
        swipeGestureRecognizerDown2.direction = .right
        view.addGestureRecognizer(swipeGestureRecognizerDown2)
        
        
    }
    
    
    
    @objc private func closeSettingsView(_ sender: UISwipeGestureRecognizer) {
        if state == true {
            UIView.animate(withDuration: 0.8) {
                self.settingView.frame = self.settingView.frame.offsetBy(dx: -290, dy: 0)
                self.settingButton.rotate(said: 2.0, duration: 0.8)
                self.closeSettingButton.rotate(said: 2.0, duration: 0.8)
                self.settingButton.alpha = 1
                self.blurView.alpha = 0
                self.state = false
            }
        }
    }
    
    
    @objc private func openSettingsView(_ sender: UISwipeGestureRecognizer) {
        if state == false {
            UIView.animate(withDuration: 0.8) {
                self.settingView.frame = self.settingView.frame.offsetBy(dx: 290, dy: 0)
                self.settingButton.rotate(said: -2.0, duration: 0.8)
                self.closeSettingButton.rotate(said: -2.0, duration: 0.8)
                self.settingButton.alpha = 0
                self.blurView.alpha = 1
                self.state = true
            }
        }
    }
    
    
    
    //MARK: - View Will layout subviews
    override func viewWillLayoutSubviews() {
        changeButtonState()
        blurView.alpha = 0 
    }
    
    
    func textFieldSettings() {
        steamIdTextField.delegate = self
        steamIdTextField.layer.cornerRadius = view.frame.height * 0.016
    }
    
    
    func keyboardObserver() {
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



extension UIView {
    func applyBlurEffect() {
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
    }
}
