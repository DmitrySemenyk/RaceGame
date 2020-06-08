//
//  SettingsCarCollectionViewCell.swift
//  MadMax
//
//  Created by Dmitry Semenuk on 24/05/2020.
//  Copyright © 2020 Dmitry Semenuk. All rights reserved.
//

import UIKit

class SettingsCarCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var carsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(imageName: String){
        if let image = UIImage(named: imageName) {
            carsImageView.image = image
            carsImageView.frame.size = CGSize(width: image.size.width * 2, height: image.size.height * 2)
            carsImageView.contentMode = .scaleAspectFit
        }
        
    }

}
