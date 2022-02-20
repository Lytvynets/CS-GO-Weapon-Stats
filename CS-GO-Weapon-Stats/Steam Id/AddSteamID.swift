//
//  AddSteamID.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 20.02.2022.
//

import Foundation
import UIKit

class AddSteamId: UITableViewController{
    
    @IBOutlet weak var idTexField: UITextField!
    
    var player = ModelSteamID(name: "")
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "SaveSegue" else { return }
        let name = idTexField.text ?? ""
        self.player = ModelSteamID(name: name)
    }
}
