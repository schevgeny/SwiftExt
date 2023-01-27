//
//  UIView+sugar.swift
//  daily_workout
//
//  Created by Valentine on 6/5/20.
//  Copyright © 2020 Eugene sch. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    var size: CGSize {
        return frame.size
    }
    
    func setBorder(color: UIColor) {
        layer.borderWidth = 1
        layer.borderColor = color.cgColor
    }
    
    func cornerCircle() {
        layer.cornerRadius = frame.height / 2
        layoutIfNeeded()
    }
    
    class func nib() -> UINib {
        return UINib(nibName: self.className, bundle: nil)
    }
    
    class func fromNib<T: UIView>() -> T {
        print(T.self)
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    func vibration() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
    
    func shadow(offset: CGSize, opacity: Float = 0.25, color: UIColor = .black, radius: CGFloat = 1) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
    }
    
    // Using a function since `var image` might conflict with an existing variable
    // (like on `UIImageView`)
    func asImage() -> UIImage {
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: bounds)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        } else {
            UIGraphicsBeginImageContext(self.frame.size)
            self.layer.render(in:UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return UIImage(cgImage: image!.cgImage!)
        }
    }
    
    public func cornerRadius(_ radius: CGFloat) {
        layer.cornerRadius = radius
    }
    
    public func configureBorder(width: CGFloat, color: UIColor, radius: CGFloat = 10.0) {
        layer.masksToBounds = true
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        layer.cornerRadius = radius
    }
    
    public func configureBlurEffect(style: UIBlurEffect.Style) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }
    
    public func showScaleAnimation(_ completion: @escaping () -> Void) {
        isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear,
                       animations: { [weak self] in
            self?.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95)
        }) { _ in
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear,
                           animations: { [weak self] in
                self?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            }) { [weak self] _ in
                self?.isUserInteractionEnabled = true
                completion()
            }
        }
    }
    
    static func getLineView(color: UIColor,
                            startPoint: CGPoint = CGPoint(x: 0, y: 0),
                            size: CGSize,
                            thickness: CGFloat = 1,
                            isHorizontal: Bool = true) -> UIView {
        let width = isHorizontal ? size.width : thickness
        let height = isHorizontal ? thickness : size.height
        let frameRect = CGRect(origin: startPoint, size: CGSize(width: width, height: height))
        let lineView = UIView(frame: frameRect)
        lineView.backgroundColor = color
        return lineView
    }
}
