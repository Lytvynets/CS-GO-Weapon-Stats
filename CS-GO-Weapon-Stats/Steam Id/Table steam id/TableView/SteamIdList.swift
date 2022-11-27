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
    
    var variables = Variables()
    var closure: ((String) -> ())?
    var id: String = ""
    var dataManager = DataManager()
    var delegate: FirstViewControllerDelegate?
    
    lazy var idLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = .black
        self.tableView.dataSource = self
        self.tableView.register(SteamIdCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.rowHeight = 50
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.08600266347, green: 0.09311696313, blue: 0.1034522734, alpha: 1)
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.realmResult().count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! SteamIdCell
        let player = dataManager.realmResult()[indexPath.row]
        cell.idLabel.text = "\(player.id):"
        cell.idLabel.font = UIFont(name: "Futura Medium", size: 17)
        cell.nameLabel.text = player.name
        cell.nameLabel.font = UIFont(name: "Avenir Book", size: 14)
        cell.backgroundColor = .black
        cell.layer.borderWidth = 2
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = dataManager.realmResult()[indexPath.row]
        delegate?.update(text: id.name)
        dismiss(animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == UITableViewCell.EditingStyle.delete else { return }
        let id = dataManager.realmResult()[indexPath.row]
        dataManager.realmDelete(code: id.name)
        tableView.reloadData()
    }
}
