//
//  UIColor+Additions.swift
//  Folio 3.0
//
//  Generated on Zeplin. (11.11.2019).
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

import UIKit

extension UIColor {

    @nonobjc class var onboardingButtonImprove: UIColor {
        return UIColor(red: 0.239, green: 0.494, blue: 0.816, alpha: 1.0)
    }
    @nonobjc class var onboardingButtonImproveSelected: UIColor {
        return UIColor(red: 0.314, green: 0.635, blue: 0.922, alpha: 1.0)
    }
    
    @nonobjc class var azureRadiance: UIColor {
        return UIColor(red: 0.0, green:0.6, blue: 0.95, alpha: 1.0)
    }
    
    @nonobjc class var azureRadiance10: UIColor {
        return UIColor(red: 0.0, green:0.6, blue: 0.95, alpha: 0.1)
    }
  
    
    func toString() -> String {
        return CIColor(color: self).stringRepresentation
    }
    
    //"1 0.5 0.5 1" - example
    static func fromString(color: String) -> UIColor {
        return UIColor(ciColor: CIColor(string: color))
    }
    
}
