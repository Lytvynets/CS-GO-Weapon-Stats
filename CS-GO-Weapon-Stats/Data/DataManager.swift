//
//  DataManager.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 19.02.2022.
//

import Foundation
import RealmSwift

class DataManager: DataManagerProtocol {

    var realm = try! Realm()
    var steamIdArray: Results<ModelSteamID>!
    var lastOperationsArray: Results<SavedSessionsModel>!
    
   
    
//    func saveId(id: AnyObject){
//        let realm = try! Realm()
//        try! realm.write{
//            realm.add(id as! Object)
//        }
//    }
    
    func deleteFromRealm(session: SavedSessionsModel, tableView: UITableView){
        try! realm.write{
            realm.delete(session)
            tableView.reloadData()
        }
    }
    
    
    func saveId(debtor: ModelSteamID){
        try! realm.write{
            realm.add(debtor)
        }
    }
    
    
    func saveSession(session: SavedSessionsModel){
        try! realm.write{
            realm.add(session)
        }
    }
    
    func realmDeleteAllClassObjects() {
        do {
            let realm = try Realm()
            
            let objects = realm.objects(ModelSteamID.self)
            
            try! realm.write {
                realm.delete(objects)
            }
        } catch let error as NSError {
            print("error - \(error.localizedDescription)")
        }
    }
    
    func realmDelete(code: String) {
        do {
            let realm = try Realm()
            
            let object = realm.objects(ModelSteamID.self).filter("name = %@", code).first
            
            try! realm.write {
                if let obj = object {
                    realm.delete(obj)
                }
            }
        } catch let error as NSError {
            print("error - \(error.localizedDescription)")
        }
    }
    
    func realmResult() -> [ModelSteamID]{
        let models = realm.objects(ModelSteamID.self)
        return Array(models)
    }
}
