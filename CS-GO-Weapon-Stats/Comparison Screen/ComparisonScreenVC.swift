//
//  ComparisonScreenVC.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 19.02.2022.
//

import Foundation
import UIKit

class ComparisonScreenVC: UIViewController, UITextFieldDelegate {
    
    var networkManager = NetworkManager()
    var variables = Variables()
    
    @IBOutlet weak var pickIdButton: UIButton!
    @IBOutlet weak var pickWeaponButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    
    @IBOutlet weak var shotsPlayer1: UILabel!
    @IBOutlet weak var killsPlayer1: UILabel!
    @IBOutlet weak var hitPlayer1: UILabel!
    
    @IBOutlet weak var killsPlayer2: UILabel!
    @IBOutlet weak var hitPlayer2: UILabel!
    @IBOutlet weak var shotsPlayer2: UILabel!
    
    @IBOutlet weak var weaponImage: UIImageView!
    @IBOutlet weak var weaponLabel: UILabel!
    
    @IBOutlet weak var idTF1: UITextField!
    @IBOutlet weak var idTF2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.idTF1.delegate = self
        self.idTF2.delegate = self
        self.pickIdButton.layer.cornerRadius = 10
        self.pickWeaponButton.layer.cornerRadius = 10
        self.okButton.layer.cornerRadius = 10
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? SteamIdTableVC else { return }
        destination.closure = { [weak self] textID in
            if self?.idTF1.text == "" {
                self?.idTF1.text = textID
            }else{
                self?.idTF2.text = textID
            }
        }
    }
    
  
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    @IBAction func pickId1(_ sender: UIButton) {
    }
    @IBAction func pickWeaponAction(_ sender: UIButton) {
    }
    
    
    @IBAction func okButtonAction(_ sender: UIButton) {
        variables.idSteam = idTF1.text
        variables.idSteamPlayer2 = idTF2.text
        networkManager.getRequest(withSteamId: variables.idSteam ?? "", forIndex: Variables.indexRow ){StatsCS in
            let image = StatsCS.imageURL
            guard let imageUrl = URL(string: image) else { return }
            let urlSession = URLSession.shared
            urlSession.dataTask(with: imageUrl) { (data, response, error) in
                if let data = data, let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self.weaponImage.image = image
                    }
                }
            }.resume()
            DispatchQueue.main.async {
                self.weaponLabel.text = StatsCS.name
                self.killsPlayer1.text = String(StatsCS.value)
                self.weaponImage.image = UIImage(contentsOfFile: image)
                self.shotsPlayer1.text = String(StatsCS.shotsFired)
                self.hitPlayer1.text = String(StatsCS.shotsHit)
            }
        }
        
        networkManager.getRequest(withSteamId: variables.idSteamPlayer2 ?? "", forIndex: Variables.indexRow ){StatsCS in
            let image = StatsCS.imageURL
            guard let imageUrl = URL(string: image) else { return }
            let urlSession = URLSession.shared
            urlSession.dataTask(with: imageUrl) { (data, response, error) in
            }.resume()
            DispatchQueue.main.async { [self] in
                self.killsPlayer2.text = String(StatsCS.value)
                self.shotsPlayer2.text = String(StatsCS.shotsFired)
                self.hitPlayer2.text = String(StatsCS.shotsHit)
            }
        }
    }
}
