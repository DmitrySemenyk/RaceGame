//
//  ViewController.swift
//  MadMax
//
//  Created by Dmitry Semenuk on 20/05/2020.
//  Copyright © 2020 Dmitry Semenuk. All rights reserved.
//

import UIKit
import RealmSwift
import FirebaseCrashlytics

class ViewController: UIViewController, CarsImagesViewDelegate, CoinImagesViewDelegate {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var roadView: UIView!
    @IBOutlet weak var roadLinesView: UIView!
    @IBOutlet weak var gestureView: UIView!
    @IBOutlet weak var helpImageView: UIImageView!
    
    var backgorundView = UIView()
    
    let realm = try! Realm()
    let resultData = ResultData()
    
    var bgImageView = BackGroundImageView()
    var roadImageView = RoadLinesView()
    var npcCars = CarsImageView()
    var coins = CoinsView()
    
    var playerName: String?
    var score: Int = 0 {
        didSet{
            scoreLabel.text = "\(score)"
        }
    }
    
    let car: UIImageView = UIImageView()
    
    var panGestureRecognizer = UIPanGestureRecognizer()
    var carsFrame: CGRect?
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //preconditionFailure()
        helpImageView.setGIFImage(name: "swipe")
        loadCar()
        
        panGestureRecognizer.addTarget(self, action: #selector(handlePanGesture(_:)))
        gestureView.addGestureRecognizer(panGestureRecognizer)
    }

    override func viewDidAppear(_ animated: Bool) {
        print("Here")
        setloadBackground()
        setRoadLines()
        setCoins()
        setNPSCars()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Done")
    }
    //MARK: - Set Interface
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setloadBackground(){
        bgImageView.fromNib()
        bgImageView.setup(frame: backgroundView.frame)
        backgroundView.addSubview(bgImageView)
    }
    
    func setRoadLines(){
        roadImageView.fromNib()
        roadImageView.setup(frame: roadLinesView.frame)
        roadLinesView.addSubview(roadImageView)
    }
    
    func setNPSCars(){
        npcCars.fromNib()
        npcCars.setup(frame: roadView.frame)
        npcCars.delegate = self
        roadView.addSubview(npcCars)
    }
    
    func setCoins(){
        coins.fromNib()
        coins.delegate = self
        coins.setup(frame: roadView.frame)
        roadView.addSubview(coins)
    }
    //MARK: - Move Cars Recognizer
    @objc func handlePanGesture(_ gestureRecogmizer: UIPanGestureRecognizer){
        switch gestureRecogmizer.state {
        case .began:
            UIView.animate(withDuration: 0.3) {
                self.helpImageView.alpha = 0
            }
        case .changed:
            if gestureRecogmizer.location(in: roadView).x > car.frame.size.width / 3 || gestureRecogmizer.location(in: roadView).x < roadView.frame.size.width - (car.frame.size.width / 3) {
                car.center.x = gestureRecogmizer.location(in: roadView).x
            }
        default:
            print("Default")
        }
    }

    func loadCar(){
        if let raceCar = UIImage(named: "Car Striped") {
            car.image = raceCar
            car.frame.size = CGSize(width: raceCar.size.width * 2, height: raceCar.size.height*2)
            car.contentMode = .scaleToFill
            car.frame.origin = CGPoint(x: roadView.frame.size.width / 2, y: roadView.frame.size.height - 300)
            roadView.addSubview(car)
        }
    }
    //MARK: - CarsImageViewGelagate methods
    func setCarsFrame(frame: CGRect){
        if self.car.frame.intersects(frame){
            guard let controler = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return }
            npcCars.delegate = nil
            npcCars.timerInvalidate()
            
            coins.delegate = nil
            coins.timerInvalidate()
            
            controler.score = score
            
            saveScoreData()
            navigationController?.pushViewController(controler, animated: true)
        }
    }
    
    //MARK: - CoinImagesViewDelegate
    func setCoinFrame(frame: CGRect, key: Int) {
        if self.car.frame.intersects(frame){
            coins.imageArray[key].removeFromSuperview()
            score += 50
        }
    }
    
    //MARK: - Realm
    
    func saveScoreData(){
        do {
            if let name = playerName {
                resultData.name = name
            }else{
                resultData.name = "noname"
            }
            resultData.result = score
            try realm.write(){
                realm.add(resultData)
            }
        } catch  {
            print("Error write score")
        }
        
        
    }
    
}

