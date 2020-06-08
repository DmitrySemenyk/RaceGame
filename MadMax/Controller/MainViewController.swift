//
//  MainViewController.swift
//  MadMax
//
//  Created by Dmitry Semenuk on 23/05/2020.
//  Copyright © 2020 Dmitry Semenuk. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var bgiImageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var scorebordButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var playerNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgiImageView.setGIFImage(name: "newMaxBG")
        bgiImageView.contentMode = .scaleToFill
    }
    
    @IBAction func start(_ sender: UIButton) {
        guard let controller = storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController else {return}
        controller.playerName = playerNameTextField.text
        navigationController?.pushViewController(controller, animated: true)
        
        
    }
    @IBAction func showScorebord(_ sender: UIButton) {
        guard let controller = storyboard?.instantiateViewController(identifier: "ScoreboardViewController") as? ScoreboardViewController else {return}
        
        navigationController?.pushViewController(controller, animated: true)
    }
    @IBAction func showSettings(_ sender: UIButton) {
        guard let controller = storyboard?.instantiateViewController(identifier: "SettingsViewController") as? SettingsViewController else {return}
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
