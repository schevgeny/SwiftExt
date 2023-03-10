//
//  UserDefaults+ext.swift
//  race
//
//  Created by Eugene sch on 8/24/20.
//  Copyright © 2020 Eugene sch. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    func set<T: Encodable>(encodable: T, forKey key: AppConstants.SettingsKey) {
        if let data = try? JSONEncoder().encode(encodable) {
            set(data, forKey: key.rawValue)
        }else {
            
        }
    }
    
    func value<T: Decodable>(_ type: T.Type, forKey key: AppConstants.SettingsKey) -> T? {
        if let data = object(forKey: key.rawValue) as? Data,
            let value = try? JSONDecoder().decode(type, from: data) {
            return value
        }
        return nil
    }
}
