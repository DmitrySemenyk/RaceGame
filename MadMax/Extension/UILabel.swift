//
//  UILabel.swift
//  MadMax
//
//  Created by Dmitry Semenuk on 24/05/2020.
//  Copyright © 2020 Dmitry Semenuk. All rights reserved.
//

import Foundation
import UIKit

extension UILabel{
    func addCustomFont(_ nameFont: String, sizeFont: CGFloat, color: String){
        self.font = UIFont(name: nameFont, size: sizeFont)
        self.textColor = UIColor.init(named: color)
    }
}
