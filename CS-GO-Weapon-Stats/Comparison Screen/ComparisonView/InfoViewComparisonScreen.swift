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
    
    lazy var shotInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var hitInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var killInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var shotInfoLabel2: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.contentMode = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var hitInfoLabel2: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.contentMode = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var killInfoLabel2: UILabel = {
        let label = UILabel()
        label.contentMode = .left
        label.text = "0"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var shotLabel: UILabel = {
        let label = UILabel()
        label.text = "Shots"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var hitLabel: UILabel = {
        let label = UILabel()
        label.text = "Hits"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var killLabel: UILabel = {
        let label = UILabel()
        label.text = "kills"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
            shotLabel.bottomAnchor.constraint(equalTo: hitLabel.topAnchor, constant: -25),
            shotLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            shotInfoLabel.bottomAnchor.constraint(equalTo: hitInfoLabel.topAnchor, constant: -25),
            shotInfoLabel.leadingAnchor.constraint(equalTo: shotLabel.leadingAnchor, constant: 80),
            hitLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            hitLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            hitInfoLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            hitInfoLabel.leadingAnchor.constraint(equalTo: hitLabel.leadingAnchor, constant: 80),
            killLabel.topAnchor.constraint(equalTo: hitLabel.bottomAnchor, constant: 25),
            killLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            killInfoLabel.topAnchor.constraint(equalTo: hitInfoLabel.bottomAnchor, constant: 25),
            killInfoLabel.leadingAnchor.constraint(equalTo: killLabel.leadingAnchor, constant: 80),
            shotInfoLabel2.bottomAnchor.constraint(equalTo: hitInfoLabel2.topAnchor, constant: -25),
            shotInfoLabel2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            hitInfoLabel2.centerYAnchor.constraint(equalTo: centerYAnchor),
            hitInfoLabel2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            killInfoLabel2.topAnchor.constraint(equalTo: hitInfoLabel.bottomAnchor, constant: 25),
            killInfoLabel2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
        ])
    }
    
    func setShadows() {
        customizeShadow.makeShadow(object: self,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 8,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: killLabel,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: killInfoLabel,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: killInfoLabel2,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: shotInfoLabel,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: shotInfoLabel2,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: hitLabel,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: hitInfoLabel,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: hitInfoLabel2,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: shotLabel,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 5,
                                   Opacity: 0.5)
    }
}
