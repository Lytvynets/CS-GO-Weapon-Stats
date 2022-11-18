//
//  ViewController.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 19.02.2022.
//
import Foundation
import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var pickWeaponButton: UIButton!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var killsLabel: UILabel!
    @IBOutlet weak var imageWeapon: UIImageView!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var shotFired: UILabel!
    @IBOutlet weak var shotHit: UILabel!
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
   
    weak var steamIdTableVC: SteamIdTableVC?
    var networkManager = NetworkManager()
    var dataManager = DataManager()
    var variables = Variables()
    var player = ModelSteamID(name: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.idTextField.delegate = self
        self.pickWeaponButton.layer.cornerRadius = 10
        self.okButton.layer.cornerRadius = 10
        self.settingsView.isHidden = true
        self.activityIndicator.isHidden = true
        saveTextField()
    }
    
    
    //MARK: - Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? SteamIdTableVC else { return }
        destination.closure = { [weak self] textID in
            self?.idTextField.text = textID
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    @IBAction func addSteamIDButton(_ sender: UIButton) {
    }
    
    
    //MARK: - UnwindSegue
    @IBAction func IdUnwindSegue(_ segue: UIStoryboardSegue){
        guard segue.identifier == "SaveSegue" else { return }
        let segue = segue.source as! AddSteamId
        let newPlayer = segue.player
        dataManager.saveId(id: newPlayer)
    }
    
    
    //MARK: - Settings Buttons
    @IBAction func closeSettings(_ sender: UIButton) {
        UIView.animate(withDuration: 0.8) {
            self.settingsView.frame = self.settingsView.frame.offsetBy(dx: -290, dy: 0)
            self.settingsButton.isHidden = false
        }
    }
    
    @IBAction func settingsButtonAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.8) {
            self.settingsView.frame = self.settingsView.frame.offsetBy(dx: 290, dy: 0)
        }
        self.settingsView.isHidden = false
        self.settingsButton.isHidden = true
    }
    
    @IBAction func pickSteamID(_ sender: UIButton) {
    }
    
    //MARK: - Save text field
    func saveTextField(){
        guard let text = UserDefaults.standard.string(forKey: variables.textFieldKey) else { return }
        idTextField.text = text
    }
    
    //MARK: - Steam id TextField
    @IBAction func steamIDTextField(_ sender: UITextField) {
        guard sender.text != nil else { return }
        UserDefaults.standard.set(sender.text!, forKey: variables.textFieldKey)
    }
    
    //MARK: - OK Button
    @IBAction func okButton(_ sender: UIButton) {
        guard idTextField.text != nil else { return }
        UserDefaults.standard.set(idTextField.text ?? "", forKey: variables.textFieldKey)
        networkManager.returnError = { error in
            DispatchQueue.main.async {
                self.nameLabel.text = error.localizedDescription
                self.activityIndicator.isHidden = true
                self.activityIndicator.stopAnimating()
            }
        }
        
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        variables.idSteam = idTextField.text
        networkManager.getRequest(withSteamId: variables.idSteam ?? "", forIndex: Variables.indexRow ){StatsCS in
            let image = StatsCS.imageURL
            guard let imageUrl = URL(string: image) else { return }
            let urlSession = URLSession.shared
            urlSession.dataTask(with: imageUrl) { (data, response, error) in
                if let data = data, let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self.imageWeapon.image = image //.withTintColor(.red)
                    }
                }
            }.resume()
            DispatchQueue.main.async {
                self.nameLabel.text = StatsCS.name
                self.killsLabel.text = String(StatsCS.value)
                self.imageWeapon.image = UIImage(contentsOfFile: image)
                self.shotFired.text = String(StatsCS.shotsFired)
                self.shotHit.text = String(StatsCS.shotsHit)
                self.activityIndicator.isHidden = true
                self.activityIndicator.stopAnimating()
            }
        }
    }
}
