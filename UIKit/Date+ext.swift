//
//  Date+ext.swift
//  motivation
//
//  Created by Eugene sch on 2.09.21.
//

import UIKit

enum DateFormats: String, @unchecked Sendable {
    case full = "YY/MM/dd hh:mm a"
    case weekDayMonth = "E d MMM"                   // Fri 21 Oct
    case monthDayHmma = "MMM d,h:mm a"              // Oct 21, 4:40 PM
    case dayMonthYearHHmm = "d MMM yyyy, HH:mm"     // 21 Oct 2022, 15:14
}

extension Date {
        
    var year: Int {
        let calendar = Calendar.current // or e.g. Calendar(identifier: .persian)
        return calendar.component(.year, from: self)
    }
    
    var month: Int {
        let calendar = Calendar.current // or e.g. Calendar(identifier: .persian)
        return calendar.component(.month, from: self)
    }
    
    var day: Int {
        let calendar = Calendar.current // or e.g. Calendar(identifier: .persian)
        return calendar.component(.day, from: self)
    }
    
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    
    var nextDay: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
    
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    
    var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }
    
    var minute: Int {
        let calendar = Calendar.current // or e.g. Calendar(identifier: .persian)
        return calendar.component(.minute, from: self)
    }
    
    var weekday: Int {
        let calendar = Calendar.current // or e.g. Calendar(identifier: .persian)
        return calendar.component(.weekday, from: self)
    }
    
    func toString(format: DateFormats = .full) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: self)
    }
    
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
    
}
