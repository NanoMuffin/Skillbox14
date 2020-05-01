//
//  RealDataBase.swift
//  Skillbox14
//
//  Created by Александр Сорока on 17.04.2020.
//  Copyright © 2020 Александр Сорока. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    
    static let RealmData = Data()
    @objc dynamic var toDo = ""
    @objc dynamic var id = 0
    @objc dynamic var toDoNumbers = 0

}
