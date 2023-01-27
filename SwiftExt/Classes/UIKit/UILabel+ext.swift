//
//  UILabel+ext.swift
//  motivation
//
//  Created by Eugene sch on 16.08.21.
//
import UIKit

extension UILabel {
    
    func drawShadow(offset: CGSize, opacity: Float = 0.25, color: UIColor = .black, radius: CGFloat = 1) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
    }
    
}
