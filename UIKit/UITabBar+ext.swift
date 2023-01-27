//
//  UITabBar+ext.swift
//  LocationTracker
//
//  Created by Oles Novikov on 16/11/2022.
//

import UIKit

public enum TabBars: Int {
    case map = 0
    case places
    case meetings
    case settings
}

extension UITabBarController {
    
    public func changeSelectedTabBar(to tabBar: TabBars) {
        self.selectedIndex = tabBar.rawValue
    }
    
}
