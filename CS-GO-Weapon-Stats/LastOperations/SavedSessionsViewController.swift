//
//  LastOperationsViewController.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 22.12.2022.
//

import UIKit
import RealmSwift

class SavedSessionsViewController: UITableViewController {
    
    var dataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SavedSessionsCell.self, forCellReuseIdentifier: "infoCell")
        tableView.backgroundColor = .black
        tableView.rowHeight = 40
        let realm = try! Realm()
        dataManager.lastOperationsArray = realm.objects(SavedSessionsModel.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.lastOperationsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! SavedSessionsCell
        let operation = dataManager.lastOperationsArray[indexPath.row]
        cell.idLabel.font = UIFont(name: "Futura Medium", size: 17)
        cell.weapon.font = UIFont(name: "Futura Medium", size: 17)
        cell.dateOperations.font = UIFont(name: "Futura Medium", size: 17)
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.systemFont(ofSize: view.frame.height * 0.02)
        cell.idLabel.text = operation.id
        cell.weapon.text = operation.weapon
        cell.dateOperations.text = operation.dateOperation
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let operation = dataManager.lastOperationsArray[indexPath.row]
        guard let vc = ProgressViewController(name: operation.id,
                                              shots: operation.shots,
                                              hits: operation.hits,
                                              kills: operation.kills,
                                              index: operation.indexWeapon,
                                              date: operation.dateOperation,
                                              nameWeapon: operation.weapon) else { return }
        vc.title = operation.id
        let navCon = UINavigationController(rootViewController: vc)
        present(navCon, animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == UITableViewCell.EditingStyle.delete else { return }
        let id = dataManager.lastOperationsArray[indexPath.row]
        dataManager.deleteFromRealm(session: id, tableView: tableView)
    }
}
