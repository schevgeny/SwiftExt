//
//  AppConstants.swift
//  Pods
//
//  Created by Yauhen Shchamialiou on 27.01.23.
//

import Foundation

struct AppConstants {
    
    struct SettingsKey: RawRepresentable {
        var rawValue: String
        static let isRequestReview = SettingsKey(rawValue: "isRequestReview")
        static let isHasSubscription = SettingsKey(rawValue: "isHasSubscription")
        static let isFirstRun = SettingsKey(rawValue: "isFirstRun")
        static let isOnboardingFinished = SettingsKey(rawValue: "isOnboardingFinished")
        static let isShowMainPage = SettingsKey(rawValue: "isShowMainPage")
        static let translateLanguage = SettingsKey(rawValue: "translateLanguage")
        static let currentUser = SettingsKey(rawValue: "currentUser")
        static let appleId = SettingsKey(rawValue: "appleId")
    }
    
}
