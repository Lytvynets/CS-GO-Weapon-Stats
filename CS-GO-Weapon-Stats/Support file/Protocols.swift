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

protocol PickSteamIdDelegate: AnyObject {
    func fillTextField(text: String)
}

protocol StateSettingsButtonDelegate: AnyObject {
    func changeButtonState()
}

protocol MainRouter {
    func showDonationScreen(from viewController: UIViewController)
    func showTutorialScreen(from viewController: UIViewController)
    func showSaveIdScreen(from viewController: UIViewController)
    func showPickWeaponScreen(from viewController: UIViewController)
}
