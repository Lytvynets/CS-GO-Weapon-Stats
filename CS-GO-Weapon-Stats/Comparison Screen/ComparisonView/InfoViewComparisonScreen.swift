//
//  InfoViewComparisonScreen.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 20.11.2022.
//

import Foundation
import UIKit

class InfoViewComparisonScreen: UIView {
    
    var customizeShadow = CustomizeShadows()
    
    lazy var shotInfoLabel = LabelBuilder(fontSize: 17, startText: "0", color: .white)
    lazy var hitInfoLabel = LabelBuilder(fontSize: 17, startText: "0", color: .white)
    lazy var killInfoLabel = LabelBuilder(fontSize: 17, startText: "0", color: .white)
    lazy var shotLabel = LabelBuilder(fontSize: 17, startText: "Shots", color: .white)
    lazy var hitLabel = LabelBuilder(fontSize: 17, startText: "Hits", color: .white)
    lazy var killLabel = LabelBuilder(fontSize: 17, startText: "kills", color: .white)
    lazy var shotInfoLabel2 = LabelBuilder(fontSize: 17, startText: "0", color: .white)
    lazy var hitInfoLabel2 = LabelBuilder(fontSize: 17, startText: "0", color: .white)
    lazy var killInfoLabel2 = LabelBuilder(fontSize: 17, startText: "0", color: .white)
    
    
    var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
        setShadows()
        activityIndicator.isHidden = true
        activityIndicator.color = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        layer.cornerRadius = 20
        backgroundColor = #colorLiteral(red: 0.1072011217, green: 0.1075766459, blue: 0.1186723337, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(killLabel)
        addSubview(killInfoLabel)
        addSubview(killInfoLabel2)
        addSubview(shotInfoLabel)
        addSubview(shotInfoLabel2)
        addSubview(shotLabel)
        addSubview(hitLabel)
        addSubview(hitInfoLabel)
        addSubview(hitInfoLabel2)
        addSubview(activityIndicator)
    }
    
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            shotLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            shotLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            shotInfoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            shotInfoLabel.leadingAnchor.constraint(equalTo: shotLabel.leadingAnchor, constant: 80),
            hitLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            hitLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            hitInfoLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            hitInfoLabel.leadingAnchor.constraint(equalTo: hitLabel.leadingAnchor, constant: 80),
            killLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            killLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            killInfoLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            killInfoLabel.leadingAnchor.constraint(equalTo: killLabel.leadingAnchor, constant: 80),
            shotInfoLabel2.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            shotInfoLabel2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            hitInfoLabel2.centerYAnchor.constraint(equalTo: centerYAnchor),
            hitInfoLabel2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            killInfoLabel2.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            killInfoLabel2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
        ])
    }
    
    func setShadows() {
        customizeShadow.makeShadowForAll(object: [self, shotLabel, shotInfoLabel, hitLabel, hitInfoLabel, killLabel, killInfoLabel, hitInfoLabel2, shotInfoLabel2, killInfoLabel2],
                                         borderWidth: nil,
                                         borderColor: nil,
                                         shadowColor: UIColor.black.cgColor,
                                         shadowRadius: 3,
                                         Opacity: 0.5)
        
    }
}
