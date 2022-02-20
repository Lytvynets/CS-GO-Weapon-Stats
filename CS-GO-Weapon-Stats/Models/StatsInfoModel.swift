//
//  StatsInfoModel.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 19.02.2022.
//

import Foundation

class StatsInfoModel: Codable{
    let name: String
    let key: String
    let imageURL: String
    let value: Int
    let shotsFired: Int
    let shotsHit: Int
    
    var index: Int
    
    init?(CSGOStats: ModelCS, index: Int){
        name = CSGOStats.data[index].metadata.name as String
        key = CSGOStats.data[index].attributes.key
        imageURL = CSGOStats.data[index].metadata.imageURL
        value = Int(CSGOStats.data[index].stats.kills.value)
        shotsFired = Int(CSGOStats.data[index].stats.shotsFired.value)
        shotsHit = Int(CSGOStats.data[index].stats.shotsHit.value)
        self.index = index
    }
}
