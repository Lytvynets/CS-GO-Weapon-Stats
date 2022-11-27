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
    
    lazy var shotInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var hitInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var killInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var shotLabel: UILabel = {
        let label = UILabel()
        label.text = "Shots"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var hitLabel: UILabel = {
        let label = UILabel()
        label.text = "Hits"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var killLabel: UILabel = {
        let label = UILabel()
        label.text = "kills"
        label.font = .systemFont(ofSize: 17)
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
        setConstraint()
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
        addSubview(shotLabel)
        addSubview(shotInfoLabel)
        addSubview(hitLabel)
        addSubview(hitInfoLabel)
        addSubview(killLabel)
        addSubview(killInfoLabel)
        addSubview(activityIndicator)
    }
    
    
    func setShadows() {
        customizeShadow.makeShadow(object: self,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 8,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: shotLabel,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 3,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: shotInfoLabel,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 3,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: hitLabel,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 3,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: hitInfoLabel,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 3,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: killLabel,
                                   borderWidth: nil,
                                   borderColor: nil,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowRadius: 3,
                                   Opacity: 0.5)
        
        customizeShadow.makeShadow(object: killInfoLabel,
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
