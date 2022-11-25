//
//  WeaponTableViewController.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 20.11.2022.
//

import Foundation
import UIKit

class WeaponTableViewController: UITableViewController {
    
    let weaponsArray = ["AK-47", "AUG", "AWP", "PP Bizon", "Desert Eagle", "Dual Berretas", "Famas", "Five - seven", "G3SG1", "Gallil AR", "Glock - 18", "P2000 + USP", "M449", "M4A4 + M16A3S", "Mac - 10", "Mag - 7", "MP7", "MP9", "Negev", "Nova", "P 250", "P 90", "Sawed - OFF", "Scar - 20", "SG 553", "SSG 08", "Zeus x27", "Tec - 9", "UMP - 45", "XM1014"]
    
    var variables = Variables()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = .black
        self.tableView.dataSource = self
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case self.tableView:
            return self.weaponsArray.count
        default:
            return 0
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.textLabel?.text = weaponsArray[indexPath.row]
        cell.backgroundColor = #colorLiteral(red: 0.1072011217, green: 0.1075766459, blue: 0.1186723337, alpha: 1)
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.systemFont(ofSize: view.frame.height * 0.02)
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Variables.indexRow = indexPath.row
        print(Variables.indexRow)
        dismiss(animated: true, completion: nil)
    }
}
