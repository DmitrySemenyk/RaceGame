//
//  ScoreboardViewController.swift
//  MadMax
//
//  Created by Dmitry Semenuk on 23/05/2020.
//  Copyright © 2020 Dmitry Semenuk. All rights reserved.
//

import UIKit
import RealmSwift

class ScoreboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var scorebordTableView: UITableView!
    @IBOutlet weak var bgImageView: UIImageView!
    
    let realm = try! Realm()
    
    var dataResult: Results<ResultData>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scorebordTableView.delegate = self
        scorebordTableView.dataSource = self
        
        scorebordTableView.register(UINib(nibName: "ScorebordTableViewCell", bundle: .main), forCellReuseIdentifier: "ScorebordTableViewCell")
        
        scorebordTableView.separatorStyle = .none
        
        bgImageView.setGIFImage(name: "bgScore")
        bgImageView.contentMode = .scaleAspectFill
        
        fetchData()

    }
    
    
    
    @IBAction func closeScorebord(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func fetchData(){
        dataResult = realm.objects(ResultData.self).sorted(byKeyPath: "result", ascending: false)
    }
    
    //MARK: - Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataResult?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ScorebordTableViewCell", for: indexPath) as? ScorebordTableViewCell else {return ScorebordTableViewCell()}
        if let dataResult = dataResult {
            if indexPath.row == 0 {
                cell.bgView.backgroundColor = .init(red: 255, green: 215, blue: 0, alpha: 1)
            }else if indexPath.row == 1 {
                cell.bgView.backgroundColor = UIColor(rgb: 0xC0C0C0)
            }else if indexPath.row == 2 {
                cell.bgView.backgroundColor = UIColor(rgb: 0xcd7f32)
            }else {
                cell.bgView.backgroundColor = .white
            }
            cell.bgView.layer.cornerRadius = cell.bgView.frame.height / 2
            cell.set(name: dataResult[indexPath.item].name, result: "\(dataResult[indexPath.item].result)")
            return cell
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
