//
//  CoinsView.swift
//  MadMax
//
//  Created by Dmitry Semenuk on 24/05/2020.
//  Copyright © 2020 Dmitry Semenuk. All rights reserved.
//

import UIKit

protocol CoinImagesViewDelegate: AnyObject{
    func setCoinFrame(frame: CGRect, key: Int)
}


class CoinsView: UIView {

    weak var delegate: CoinImagesViewDelegate?
    var imageArray = [UIImageView]()
    var timer = Timer()
    
    
    override init(frame: CGRect) { // for using CustomView in code
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) { // for using CustomView in IB
        super.init(coder: aDecoder)
    }

    
    func setup(frame: CGRect){
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            var imageView = UIImageView()
            self.imageArray.append(imageView)
            imageView.frame = CGRect(
                x: CGFloat(Int.random(in: 0...Int(frame.size.width))),
                y: -200,
                width: 40 ,
                height: 40)
            imageView.setGIFImage(name: "source")
            imageView.contentMode = .scaleToFill
            
            self.addSubview(imageView)
            
            UIView.animate(withDuration: 4, delay: 3, options: [.curveLinear], animations: {
                imageView.frame.origin.y = 1000
            }) { (_) in
                imageView.removeFromSuperview()
                imageView = UIImageView()
            }
        }
        createDisplayLink()
    }
    
    func createDisplayLink() {
        let displaylink = CADisplayLink(target: self,
                                        selector: #selector(step))
        displaylink.add(to: .current,
                        forMode: .default)
    }

    @objc func step(displaylink: CADisplayLink) {
        for (key,elem) in imageArray.enumerated() {
            if elem.layer.presentation()?.frame.origin.y == 1000 {
                if imageArray.indices.contains(key){
                    imageArray.remove(at: key)
                }
            }
            delegate?.setCoinFrame(frame: elem.layer.presentation()?.frame ?? CGRect(), key: key)
        }
    }
    
    func timerInvalidate(){
        timer.invalidate()
    }
}
