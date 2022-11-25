//
//  CustomizeShadows.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 20.11.2022.
//

import Foundation
import UIKit

class CustomizeShadows {
    func makeShadow<T: UIView>(object: T, borderWidth: CGFloat?, borderColor: CGColor?, shadowColor: CGColor, shadowRadius: CGFloat, Opacity: Float) {
        object.layer.borderWidth = borderWidth ?? 0
        object.layer.borderColor = borderColor
        object.layer.masksToBounds = true
        object.layer.shadowColor = shadowColor
        object.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        object.layer.shadowRadius = shadowRadius
        object.layer.shadowOpacity = Opacity
        object.layer.masksToBounds = false
    }
}
