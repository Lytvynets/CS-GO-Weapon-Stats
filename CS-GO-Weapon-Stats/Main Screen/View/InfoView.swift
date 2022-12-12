//
//  InfoView.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 20.11.2022.
//

import Foundation
import UIKit

class InfoView: UIView {
    
    var customizeShadow = CustomizeShadows()
    
    lazy var shotInfoLabel = LabelBuilder(fontSize: 17, startText: "0", color: .white)
    lazy var hitInfoLabel = LabelBuilder(fontSize: 17, startText: "0", color: .white)
    lazy var killInfoLabel = LabelBuilder(fontSize: 17, startText: "0", color: .white)
    lazy var shotLabel = LabelBuilder(fontSize: 17, startText: "Shots", color: .white)
    lazy var hitLabel = LabelBuilder(fontSize: 17, startText: "Hits", color: .white)
    lazy var killLabel = LabelBuilder(fontSize: 17, startText: "kills", color: .white)
    
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraint()
        setShadows()
        activityIndicatorSettings()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        layer.cornerRadius = 20
        backgroundColor = #colorLiteral(red: 0.1072011217, green: 0.1075766459, blue: 0.1186723337, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(shotLabel)
        addSubview(shotInfoLabel)
        addSubview(hitLabel)
        addSubview(hitInfoLabel)
        addSubview(killLabel)
        addSubview(killInfoLabel)
        addSubview(activityIndicator)
    }
    
    func activityIndicatorSettings() {
        activityIndicator.isHidden = true
        activityIndicator.color = .white
    }
    
    func setShadows() {
        customizeShadow.makeShadowForAll(object: [self, shotLabel, shotInfoLabel, hitLabel, hitInfoLabel, killLabel, killInfoLabel],
                                         borderWidth: nil,
                                         borderColor: nil,
                                         shadowColor: UIColor.black.cgColor,
                                         shadowRadius: 3,
                                         Opacity: 0.5)
    }
    
    
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            shotLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            shotLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 90),
            shotInfoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            shotInfoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -90),
            hitLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 90),
            hitLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            hitInfoLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            hitInfoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -90),
            killLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            killLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 90),
            killInfoLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            killInfoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -90)
        ])
    }
}
