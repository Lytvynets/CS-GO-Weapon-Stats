//
//  Protocols.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 19.02.2022.
//

import Foundation
import RealmSwift

protocol NetworkManagerProtocol {
    func getRequest(withSteamId steamId: String, forIndex index: Int, completionHandler:@escaping (StatsInfoModel) -> Void)
    func parseJson(forIndex index: Int,  withData data: Data) -> StatsInfoModel?
}

protocol DataManagerProtocol {
    func saveId(id: AnyObject)
    func realmDeleteAllClassObjects()
    func realmDelete(code: String)
    func realmResult() -> [ModelSteamID]
}
