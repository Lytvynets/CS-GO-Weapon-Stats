//
//  LastOperationsCell.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 22.12.2022.
//

import Foundation
import UIKit

class SavedSessionsCell: UITableViewCell {
    
    lazy var idLabel = LabelBuilder(fontSize: 17, startText: "", color: .white)
    lazy var weapon = LabelBuilder(fontSize: 17, startText: "", color: .white)
    lazy var dateOperations = LabelBuilder(fontSize: 17, startText: "26.04.2018", color: .white)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(idLabel)
        contentView.addSubview(weapon)
        contentView.addSubview(dateOperations)
        contentView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        setConstraints()
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            idLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            idLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            weapon.leadingAnchor.constraint(equalTo: idLabel.trailingAnchor, constant: 15),
            weapon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dateOperations.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dateOperations.leadingAnchor.constraint(equalTo: weapon.trailingAnchor, constant: 15),
        ])
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
