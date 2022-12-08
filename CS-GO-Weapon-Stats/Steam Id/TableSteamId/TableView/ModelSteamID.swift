//
//  ModelSteamID.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 19.02.2022.
//

import Foundation
import RealmSwift

class ModelSteamID: Object {
    @objc dynamic var name = ""
    @objc dynamic var id = ""
    
    convenience init(name: String, id: String){
        self.init()
        self.name = name
        self.id = id
    }
}
