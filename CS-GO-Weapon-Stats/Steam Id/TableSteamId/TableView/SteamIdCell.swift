//
//  SteamIdCell.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 19.02.2022.
//

import Foundation
import UIKit

class SteamIdCell: UITableViewCell {
    
    lazy var idLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(idLabel)
        contentView.addSubview(nameLabel)
        contentView.backgroundColor = #colorLiteral(red: 0.1072011217, green: 0.1075766459, blue: 0.1186723337, alpha: 1)
        contentView.layer.cornerRadius = 22
        setConstraints()
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            idLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            idLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: idLabel.trailingAnchor, constant: 15),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
