//
//  ScorebordTableViewCell.swift
//  MadMax
//
//  Created by Dmitry Semenuk on 24/05/2020.
//  Copyright © 2020 Dmitry Semenuk. All rights reserved.
//

import UIKit

class ScorebordTableViewCell: UITableViewCell {

    @IBOutlet weak var namePlayerLabel: UILabel!
    @IBOutlet weak var resultPlayerLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func set(name: String, result: String) {
        bgView.layer.cornerRadius = bgView.frame.size.height / 2
        namePlayerLabel.text = name
        resultPlayerLabel.text = result
    }
    
}
