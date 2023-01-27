//
// Created by Eduard Zakabluk on 26.10.2020.
// Copyright (c) 2020 CuspyMobileApps. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefault<T> {
    let key: AppConstants.SettingsKey
    let defaultValue: T
    var wrappedValue: T {
        get {
            UserDefaults.standard.object(forKey: key.rawValue) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key.rawValue)
        }
    }
}
