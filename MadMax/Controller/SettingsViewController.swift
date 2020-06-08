//
//  SettingsViewController.swift
//  MadMax
//
//  Created by Dmitry Semenuk on 23/05/2020.
//  Copyright © 2020 Dmitry Semenuk. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var carsImageArrayName: [String] = ["Car blue","Car grey","Car red","Car Striped","Car yellow"]
    
    @IBOutlet weak var carsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        carsCollectionView.delegate = self
        carsCollectionView.dataSource = self
        
        carsCollectionView.register(UINib(nibName: "SettingsCarCollectionViewCell",
              bundle: Bundle.main),
        forCellWithReuseIdentifier: "SettingsCarCollectionViewCell")
    }
    @IBAction func closeSettings(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
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
