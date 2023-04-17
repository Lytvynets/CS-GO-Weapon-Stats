//
//  LastOperationsModel.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 22.12.2022.
//

import Foundation
import RealmSwift

class SavedSessionsModel: Object {
   
    @objc dynamic var id = ""
    @objc dynamic var indexWeapon = 0
    @objc dynamic var weapon = ""
    @objc dynamic var shots = ""
    @objc dynamic var hits = ""
    @objc dynamic var kills = ""
    @objc dynamic var dateOperation = ""
    
    convenience init(id: String, indexWeapon: Int, weapon: String, shots: String, hits: String, kills: String, dateOperation: String){
        self.init()
        self.id = id
        self.indexWeapon = indexWeapon
        self.weapon = weapon
        self.shots = shots
        self.hits = hits
        self.kills = kills
        self.dateOperation = dateOperation
    }
}
