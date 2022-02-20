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
    
    convenience init(name: String){
        self.init()
        self.name = name
    }
}
