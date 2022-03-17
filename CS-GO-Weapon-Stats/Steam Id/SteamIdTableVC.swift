//
//  SteamIdTableVC.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 19.02.2022.
//

import Foundation
import UIKit

class SteamIdTableVC: UITableViewController {
    @IBOutlet weak var steamTableView: UITableView!
    
    var variables = Variables()
    var closure: ((String) -> ())?
    var id: String = ""
    var dataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = .black
        self.tableView.separatorColor = .white
        self.tableView.separatorStyle = .singleLine
    }
    
    
    //MARK: - TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.realmResult().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SteamIdCell
        let id = dataManager.realmResult()[indexPath.row]
      //  cell.iD.text = id.name
        cell.textLabel?.text = id.name
        cell.textLabel?.textColor = .white
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = dataManager.realmResult()[indexPath.row]
        variables.testId = id.name
        closure?("\(variables.testId)")
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == UITableViewCell.EditingStyle.delete else { return }
        let id =  dataManager.realmResult()[indexPath.row]
        dataManager.realmDelete(code: id.name)
        tableView.reloadData()
    }
}
