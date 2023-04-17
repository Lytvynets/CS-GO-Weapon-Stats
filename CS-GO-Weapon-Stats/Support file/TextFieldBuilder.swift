//
//  TextFieldBuilder.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 20.12.2022.
//

import UIKit

class TextFieldBuilder: UITextField {
    
    var textPlaceholder: String = ""
    var fontSize: CGFloat = 0
    
    init(textPlaceholder: String, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textPlaceholder = textPlaceholder
        self.fontSize = fontSize
        placeholder = textPlaceholder
        borderStyle = .none
        textAlignment = .center
        backgroundColor = #colorLiteral(red: 0.1072011217, green: 0.1075766459, blue: 0.1186723337, alpha: 1)
        textColor = .white
        font = UIFont.systemFont(ofSize: fontSize)
        keyboardType = UIKeyboardType.default
        returnKeyType = UIReturnKeyType.done
        translatesAutoresizingMaskIntoConstraints = false
        clearButtonMode = UITextField.ViewMode.whileEditing
        contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
