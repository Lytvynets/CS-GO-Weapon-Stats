//
//  Animations.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 20.11.2022.
//

import Foundation
import UIKit

//MARK: - Button extension
extension UIButton{
    func rotate(said: Double, duration: Double) {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * said)
        rotation.duration = duration
        rotation.isCumulative = true
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
