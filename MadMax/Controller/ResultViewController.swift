//
//  ResultViewController.swift
//  MadMax
//
//  Created by Dmitry Semenuk on 23/05/2020.
//  Copyright © 2020 Dmitry Semenuk. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var bgImageView: UIImageView!
    
    var score: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let score = score {
            resultLabel.text = "YOUR SCORE WAS \(String(describing: score))"
        }
        bgImageView.setGIFImage(name: "96681345928a4a4a6279e7f12c27c500")
        bgImageView.contentMode = .scaleToFill
    }
    
    @IBAction func setRootController(_ sender: Any) {
        guard let controller = self.navigationController else {
            return
        }
        
        controller.popToRootViewController(animated: true)
    }
}
