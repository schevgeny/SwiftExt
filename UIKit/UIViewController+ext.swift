//
//  UIViewController+Alerts.swift
//  daily_workout
//
//  Created by Valentine on 7/29/20.
//  Copyright © 2020 Eugene sch. All rights reserved.
//

import UIKit

extension UIViewController {

    var nearestNavigationController: UINavigationController? {
        guard !(self is UINavigationController) else {
            return self as? UINavigationController
        }
        if let tabBarController = self as? UITabBarController {
            return tabBarController.selectedViewController as? UINavigationController
        }
        var navController: UINavigationController? = nil
        var viewController: UIViewController? = self
        while viewController != nil && navController == nil {
            navController = viewController?.navigationController
            viewController = viewController?.parent
        }
        return navigationController
    }
    
    func presentAlertController(_ title: String? = "Warning", message: String?, _ completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel) { [unowned alertController] _ in
            alertController.dismiss(animated: true, completion: completion)
        })
        self.present(alertController, animated: true, completion: nil)
    }

    
    func presentAlertController(_ title: String? = "Warning", message: String?, delay: Double) {
        if delay == 0 {
            self.presentAlertController(title, message: message)
            return
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
            self.presentAlertController(title, message: message)
        })
    }
    
    static func loadFromStoryboard<VC: UIViewController>(with storyboardName: String) -> VC {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: self.className) as! VC
    }
    
    static func loadFromStoryboard<VC: UIViewController>(sb storyboardName: String, withIdentifier: String) -> VC {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: withIdentifier) as! VC
    }
    
    func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
  
    
}
