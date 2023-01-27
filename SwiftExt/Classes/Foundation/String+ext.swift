//
//  String+Sugar.swift
//  daily_workout
//
//  Created by Valentine on 7/29/20.
//  Copyright © 2020 Eugene sch. All rights reserved.
//

import Foundation

extension String {
    
    func substring(location: Int, length: Int) -> String? {
        guard count >= location + length else { return nil }
        let start = index(startIndex, offsetBy: location)
        let end = index(startIndex, offsetBy: location + length)
        return String(self[start ..< end])
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    // 6 characters total
    func isValidPassword() -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "().{8,}")
        return passwordTest.evaluate(with: self)
    }
    
    func toFloat() -> Float {
        return (self as NSString).floatValue
    }
    
    func firstCharacterUpperCase() -> String? {
        guard !isEmpty else { return nil }
        let lowerCasedString = self.lowercased()
        return lowerCasedString.replacingCharacters(in: lowerCasedString.startIndex...lowerCasedString.startIndex, with: String(lowerCasedString[lowerCasedString.startIndex]).uppercased())
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.firstCharacterUpperCase() ?? ""
    }
    
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.full.rawValue
        return dateFormatter.date(from: self)
    }
    
}
