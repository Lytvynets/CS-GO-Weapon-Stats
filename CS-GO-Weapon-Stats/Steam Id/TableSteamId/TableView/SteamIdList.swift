//
//  SteamIdList.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 20.11.2022.
//

import Foundation
import UIKit
import RealmSwift


class SteamIdList: UITableViewController {
    
    var router: MainRouter = Router.shared
    var variables = Variables()
    var closure: ((String) -> ())?
    var id: String = ""
    var dataManager = DataManager()
    var delegate: PickSteamIdDelegate?
    var buttonColor = #colorLiteral(red: 0.9992486835, green: 0.7128490806, blue: 0.0003235559561, alpha: 1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = .black
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(SteamIdCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.rowHeight = 50
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem?.tintColor = buttonColor
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.08600266347, green: 0.09311696313, blue: 0.1034522734, alpha: 1)
        let realm = try! Realm()
        dataManager.steamIdArray = realm.objects(ModelSteamID.self)
        NotificationCenter.default.addObserver(self, selector: #selector(self.refresh), name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
        
        self.tableView.reloadData()
    }
    
    
    @objc func addTapped() {
        router.showSaveIdScreen(from: self)
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.steamIdArray?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! SteamIdCell
        let player = dataManager.steamIdArray[indexPath.row]
        cell.idLabel.text = "\(player.id):"
        cell.idLabel.font = UIFont(name: "Futura Medium", size: 17)
        cell.nameLabel.text = player.name
        cell.nameLabel.font = UIFont(name: "Avenir Book", size: 14)
        cell.backgroundColor = .black
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = dataManager.steamIdArray[indexPath.row]
        delegate?.fillTextField(text: id.name)
        dismiss(animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == UITableViewCell.EditingStyle.delete else { return }
        let id = dataManager.steamIdArray[indexPath.row]
        dataManager.realmDelete(code: id.name)
        tableView.reloadData()
    }
    
    @objc func refresh() {
        self.tableView.reloadData()
    }
    
}
