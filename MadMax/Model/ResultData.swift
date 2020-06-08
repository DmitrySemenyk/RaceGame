//
//  ResultData.swift
//  MadMax
//
//  Created by Dmitry Semenuk on 24/05/2020.
//  Copyright © 2020 Dmitry Semenuk. All rights reserved.
//

import Foundation
import RealmSwift

class ResultData: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var result: Int = 0
}
