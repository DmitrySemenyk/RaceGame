//
//  CarsImageView.swift
//  MadMax
//
//  Created by Dmitry Semenuk on 21/05/2020.
//  Copyright © 2020 Dmitry Semenuk. All rights reserved.
//

import UIKit

protocol CarsImagesViewDelegate: AnyObject{
    func setCarsFrame(frame: CGRect)
}

class CarsImageView: UIView {
    
    weak var delegate: CarsImagesViewDelegate?
    var timer = Timer()
    var count: Int = 0
    var dificult: Double = 3.00
    var carsImageArrayName: [String] = ["Bus orange front", "Bus blue front", "Police car front", "School bus front", "Taxi front", "Truck front gray", "Truck white front", "Truck front", "White truck front", "Van rundown front", "White van front"]
    var imagesView = [UIImageView]()
    
    override init(frame: CGRect) { // for using CustomView in code
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) { // for using CustomView in IB
        super.init(coder: aDecoder)
    }
    
    //MARK: - Setup Cars
    func setup(frame: CGRect){
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            print("car")
            let index: Int = Int.random(in: 0...self.carsImageArrayName.count-1)
            let image = UIImage(named: self.carsImageArrayName[index])
            let imageView = UIImageView()
            
            self.imagesView.append(imageView)
            imageView.frame = CGRect(
                x: CGFloat(Int.random(in: 0...Int(frame.size.width))),
                y: -200,
                width: image!.size.width * 2 ,
                height: image!.size.height * 2)
            imageView.contentMode = .scaleToFill
            imageView.image = image
            self.addSubview(imageView)
            
            
            UIView.animate(withDuration: 2, delay: 3, options: [.curveLinear], animations: {
                imageView.frame.origin.y = 1000
            }) { (_) in
                imageView.removeFromSuperview()
            }
        }
        createDisplayLink()
    }
    
    func stopTimer() {
        timer.invalidate()
    }
    
    //MARK: - Observe chnage frame Cars
    func createDisplayLink() {
        let displaylink = CADisplayLink(target: self,
                                        selector: #selector(step))
        displaylink.add(to: .main,
                        forMode: .default)
    }

    @objc func step(displaylink: CADisplayLink) {
        for (key,elem) in imagesView.enumerated(){
            if let frame = elem.layer.presentation()?.frame.origin.y {
                if frame == CGFloat(1000) {
                    if imagesView.indices.contains(key) {
                        imagesView.remove(at: key)
                    }
                }
            }
            delegate?.setCarsFrame(frame: elem.layer.presentation()?.frame ?? CGRect())
        }
    }
    
    func timerInvalidate(){
        timer.invalidate()
    }
    
    func setTimerInterval(){
        timerInvalidate()
        count = 0
    }

}
