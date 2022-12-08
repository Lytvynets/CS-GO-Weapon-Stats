//
//  Extensions.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 27.11.2022.
//

import Foundation
import UIKit

extension MainScreenViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}


extension MainScreenViewController: PickSteamIdDelegate {
    func fillTextField(text: String) {
        steamIdTextField.text = text
    }
}


extension MainScreenViewController: StateSettingsButtonDelegate {
    func changeButtonState() {
        self.settingButton.alpha = 1
        self.state = false
    }
}
