//
//  UserDefaults.swift
//  Skillbox14
//
//  Created by Александр Сорока on 15.04.2020.
//  Copyright © 2020 Александр Сорока. All rights reserved.
//

import Foundation


class StoredData {
    
    static let Data = StoredData()
    private let DataKey = "UserDefaultsKey"
    private let DataKey2 = "Key2"
    
    var userName: String? {
        set { UserDefaults.standard.set(newValue, forKey: DataKey) }
        get { return UserDefaults.standard.string(forKey: DataKey)}
    }
    
    var userFamilyName: String? {
        set { UserDefaults.standard.set(newValue, forKey: DataKey2) }
        get { return UserDefaults.standard.string(forKey: DataKey2)}
    }
    
    
    
}
