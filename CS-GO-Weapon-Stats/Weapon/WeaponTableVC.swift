//
//  WeaponTableVC.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 19.02.2022.
//

import Foundation
import UIKit

class WeaponTableVC: UITableViewController {
    
    var variables = Variables()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = .black
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Variables.indexRow = indexPath.row
        print(Variables.indexRow)
        dismiss(animated: true, completion: nil)
    }
}
