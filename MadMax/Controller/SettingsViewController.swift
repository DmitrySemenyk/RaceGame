//
//  SettingsViewController.swift
//  MadMax
//
//  Created by Dmitry Semenuk on 23/05/2020.
//  Copyright © 2020 Dmitry Semenuk. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var carsCollectionView: UICollectionView!

    var carsImageArrayName: [String] = ["Car blue","Car grey","Car red","Car Striped","Car yellow"]
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        carsCollectionView.delegate = self
        carsCollectionView.dataSource = self
        carsCollectionView.register(UINib(nibName: "SettingsCarCollectionViewCell",
              bundle: Bundle.main),
        forCellWithReuseIdentifier: "SettingsCarCollectionViewCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        backgroundImageView.image = R.image.garagelight()
        backgroundImageView.contentMode = .scaleToFill
    }
    
    //MARK: - Action
    @IBAction func closeSettings(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Background
    
    
    // MARK: - Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carsImageArrayName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SettingsCarCollectionViewCell", for: indexPath) as? SettingsCarCollectionViewCell else {return SettingsCarCollectionViewCell()}
        cell.set(imageName: carsImageArrayName[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: carsCollectionView.frame.size.width, height: carsCollectionView.frame.size.height)
    }
    
}
