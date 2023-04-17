//
//  ProgressViewController.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 22.12.2022.
//

import UIKit

class ProgressViewController: UIViewController {
    
    var index = 0
    var name = ""
    var shots = ""
    var hits = ""
    var kills = ""
    var date = ""
    var nameWeapon = ""
    
    var savedSessionInfoView: UIView = {
        let savedSession = UIView()
        savedSession.backgroundColor = #colorLiteral(red: 0.1072011217, green: 0.1075766459, blue: 0.1186723337, alpha: 1)
        savedSession.layer.cornerRadius = 20
        savedSession.translatesAutoresizingMaskIntoConstraints = false
        return savedSession
    }()
    
    var nowSessionInfoView: UIView = {
        let savedSession = UIView()
        savedSession.backgroundColor = #colorLiteral(red: 0.1072011217, green: 0.1075766459, blue: 0.1186723337, alpha: 1)
        savedSession.layer.cornerRadius = 20
        savedSession.translatesAutoresizingMaskIntoConstraints = false
        return savedSession
    }()
    
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    
    var dataManager = DataManager()
    var networkManager = NetworkManager()
    
    lazy var nameLabel = LabelBuilder(fontSize: 30, startText: "Name", color: .white)
    lazy var dateLabel = LabelBuilder(fontSize: 20, startText: "26.04.2018", color: .gray)
    lazy var shotInfoLabel = LabelBuilder(fontSize: 17, startText: "0", color: .white)
    lazy var hitInfoLabel = LabelBuilder(fontSize: 17, startText: "0", color: .white)
    lazy var killInfoLabel = LabelBuilder(fontSize: 17, startText: "0", color: .white)
    lazy var shotLabel = LabelBuilder(fontSize: 25, startText: "Shots", color: .white)
    lazy var hitLabel = LabelBuilder(fontSize: 25, startText: "Hits", color: .white)
    lazy var killLabel = LabelBuilder(fontSize: 25, startText: "kills", color: .white)
    lazy var dateLabelNow = LabelBuilder(fontSize: 20, startText: "Today", color: .gray)
    lazy var shotInfoLabelNow = LabelBuilder(fontSize: 17, startText: "0", color: .white)
    lazy var hitInfoLabelNow = LabelBuilder(fontSize: 17, startText: "0", color: .white)
    lazy var killInfoLabelNow = LabelBuilder(fontSize: 17, startText: "0", color: .white)
    lazy var shotInfoLabelProgress = LabelBuilder(fontSize: 12, startText: "+0", color: .green)
    lazy var hitInfoLabelProgress = LabelBuilder(fontSize: 12, startText: "+0", color: .green)
    lazy var killInfoLabelProgress = LabelBuilder(fontSize: 12, startText: "+0", color: .green)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.addSubview(savedSessionInfoView)
        view.addSubview(nowSessionInfoView)
        view.addSubview(nameLabel)
        view.addSubview(dateLabel)
        view.addSubview(shotLabel)
        view.addSubview(shotInfoLabel)
        view.addSubview(hitLabel)
        view.addSubview(hitInfoLabel)
        view.addSubview(killLabel)
        view.addSubview(killInfoLabel)
        view.addSubview(dateLabelNow)
        view.addSubview(shotInfoLabelNow)
        view.addSubview(hitInfoLabelNow)
        view.addSubview(killInfoLabelNow)
        view.addSubview(shotInfoLabelProgress)
        view.addSubview(hitInfoLabelProgress)
        view.addSubview(killInfoLabelProgress)
        
        view.addSubview(activityIndicator)
        
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.08600266347, green: 0.09311696313, blue: 0.1034522734, alpha: 1)
        
        let now = Date()
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        let dateTime = dateFormater.string(from: now)
        
        nameLabel.text = nameWeapon
        shotInfoLabel.text = shots
        hitInfoLabel.text = hits
        killInfoLabel.text = kills
        dateLabel.text = date
        dateLabelNow.text = dateTime
        fontSettings()
        setConstraint()
        activityIndicatorSettings()
    }
    
    
    func activityIndicatorSettings() {
        activityIndicator.isHidden = true
        activityIndicator.color = .white
    }
    
    func fontSettings() {
        nameLabel.font = UIFont(name: "Futura Bold", size: view.frame.height * 0.035)
        dateLabel.font = UIFont(name: "Futura Bold", size: view.frame.height * 0.022)
        shotInfoLabel.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.02)
        hitInfoLabel.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.02)
        killInfoLabel.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.02)
        
        shotLabel.font = UIFont(name: "Futura Bold", size: view.frame.height * 0.03)
        hitLabel.font = UIFont(name: "Futura Bold", size: view.frame.height * 0.03)
        killLabel.font = UIFont(name: "Futura Bold", size: view.frame.height * 0.03)
        
        dateLabelNow.font = UIFont(name: "Futura Bold", size: view.frame.height * 0.022)
        shotInfoLabelNow.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.02)
        hitInfoLabelNow.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.02)
        killInfoLabelNow.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.02)
        
        shotInfoLabelProgress.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.014)
        hitInfoLabelProgress.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.014)
        killInfoLabelProgress.font = UIFont(name: "Futura Medium", size: view.frame.height * 0.014)
        
    }
    
    
    func showAlert(_ message: String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        networkManager.returnErrorString = { error in
            DispatchQueue.main.async {
                self.showAlert(error)
                self.activityIndicator.isHidden = true
                self.activityIndicator.stopAnimating()
            }
        }
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        networkManager.getRequest(withSteamId: name, forIndex: index) { info in
            DispatchQueue.main.async {
                self.shotInfoLabelNow.text = "\(info.shotsFired)"
                self.hitInfoLabelNow.text = "\(info.shotsHit)"
                self.killInfoLabelNow.text = "\(info.value)"
                DispatchQueue.global(qos: .background).sync {
                    let shots1 = Int(self.shotInfoLabelNow.text ?? "")
                    let shots2 = Int(self.shotInfoLabel.text ?? "")
                    let hits1 = Int(self.hitInfoLabelNow.text ?? "")
                    let hits2 = Int(self.hitInfoLabel.text ?? "")
                    let kills1 = Int(self.killInfoLabelNow.text ?? "")
                    let kills2 = Int(self.killInfoLabel.text ?? "")
                    self.shotInfoLabelProgress.text = "+\((shots1 ?? 0) - (shots2 ?? 0))"
                    self.hitInfoLabelProgress.text = "+\((hits1 ?? 0) - (hits2 ?? 0))"
                    self.killInfoLabelProgress.text = "+\((kills1 ?? 0) - (kills2 ?? 0))"
                    self.activityIndicator.isHidden = true
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    
    init?(name: String, shots: String, hits: String, kills: String, index: Int, date: String, nameWeapon: String) {
        super.init(nibName: nil, bundle: nil)
        self.name = name
        self.shots = shots
        self.hits = hits
        self.kills = kills
        self.index = index
        self.date = date
        self.nameWeapon = nameWeapon
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.topAnchor.constraint(equalTo: savedSessionInfoView.bottomAnchor, constant: 10),
            
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: shotLabel.bottomAnchor, constant: 16),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            savedSessionInfoView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            savedSessionInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            savedSessionInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            savedSessionInfoView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/12),
            
            shotLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 25),
            shotLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            
            shotInfoLabel.centerYAnchor.constraint(equalTo: savedSessionInfoView.centerYAnchor),
            shotInfoLabel.centerXAnchor.constraint(equalTo: shotLabel.centerXAnchor),
            
            hitLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 25),
            hitLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            hitInfoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hitInfoLabel.centerYAnchor.constraint(equalTo: savedSessionInfoView.centerYAnchor),
            
            killLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 25),
            killLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            killInfoLabel.centerYAnchor.constraint(equalTo: savedSessionInfoView.centerYAnchor),
            killInfoLabel.centerXAnchor.constraint(equalTo: killLabel.centerXAnchor),
            
            dateLabelNow.topAnchor.constraint(equalTo: shotInfoLabel.bottomAnchor, constant: 40),
            dateLabelNow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            nowSessionInfoView.topAnchor.constraint(equalTo: dateLabelNow.bottomAnchor, constant: 5),
            nowSessionInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nowSessionInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nowSessionInfoView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/12),
            
            shotInfoLabelProgress.bottomAnchor.constraint(equalTo: shotInfoLabelNow.topAnchor, constant: 1),
            shotInfoLabelProgress.leadingAnchor.constraint(equalTo: shotInfoLabelNow.trailingAnchor, constant: 1),
            hitInfoLabelProgress.bottomAnchor.constraint(equalTo: hitInfoLabelNow.topAnchor, constant: 1),
            hitInfoLabelProgress.leadingAnchor.constraint(equalTo: hitInfoLabelNow.trailingAnchor, constant: 1),
            killInfoLabelProgress.bottomAnchor.constraint(equalTo: killInfoLabelNow.topAnchor, constant: 1),
            killInfoLabelProgress.leadingAnchor.constraint(equalTo: killInfoLabelNow.trailingAnchor, constant: 1),
            
            shotInfoLabelNow.centerYAnchor.constraint(equalTo: nowSessionInfoView.centerYAnchor),
            shotInfoLabelNow.centerXAnchor.constraint(equalTo: shotLabel.centerXAnchor),
            hitInfoLabelNow.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hitInfoLabelNow.centerYAnchor.constraint(equalTo: nowSessionInfoView.centerYAnchor),
            killInfoLabelNow.centerYAnchor.constraint(equalTo: nowSessionInfoView.centerYAnchor),
            killInfoLabelNow.centerXAnchor.constraint(equalTo: killLabel.centerXAnchor)
        ])
    }
}
