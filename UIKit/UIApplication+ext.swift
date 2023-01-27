//
//  UIApplication.swift
//  motivation
//
//  Created by Eugene sch on 10.12.21.
//

import UIKit

extension UIApplication {
    
    static func getWindowBounds() -> CGRect {
        guard let window = getKeyWindow() else { return CGRect()}
        return window.bounds
    }
    
    static func getKeyWindow() -> UIWindow? {
        return UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
    }
}
