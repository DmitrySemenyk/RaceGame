//
//  RoadLinesView.swift
//  MadMax
//
//  Created by Dmitry Semenuk on 21/05/2020.
//  Copyright © 2020 Dmitry Semenuk. All rights reserved.
//

import UIKit

class RoadLinesView: UIView {
    let imageView = UIImageView()
    let firstImage = UIImageView()

    override init(frame: CGRect) { // for using CustomView in code
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) { // for using CustomView in IB
        super.init(coder: aDecoder)
    }
    
    func setup(frame: CGRect){
        imageView.frame.size.width = frame.size.width
        imageView.frame.size.height = frame.size.width * 5
        imageView.frame.origin = CGPoint(x: 0, y: -imageView.frame.size.height)
        imageView.contentMode = .scaleToFill
        imageView.image = R.image.roadLines()
        
        firstImage.frame.size.width = frame.size.width
        firstImage.frame.size.height = frame.size.width * 5
        firstImage.frame.origin = CGPoint(x: 0, y: 0)
        firstImage.contentMode = .scaleToFill
        firstImage.image = R.image.roadLines()
        
        addSubview(imageView)
        addSubview(firstImage)
        
        animateBGImage()
    }
    
    func animateBGImage(){
        UIView.animate(withDuration: 7, delay: 3, options: [.curveLinear, .repeat], animations: {
            self.imageView.frame.origin.y = 0
            self.firstImage.frame.origin.y = self.firstImage.frame.size.height
        })
    }

}
