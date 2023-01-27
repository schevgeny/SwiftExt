//
//  UIImage+ext.swift
//  LocationTracker
//
//  Created by Eugene sch on 11.02.22.
//

import UIKit

extension UIImage {
    
    //static let circle = UIImage(systemName: "circle")
    //static let checkmarkCircleFill = UIImage(systemName: "checkmark.circle.fill")
    
    func getfitInSquareImage() -> UIImage {
        let sqareWidth = max(self.size.width, self.size.height)
        let newSize = CGSize(width: sqareWidth, height: sqareWidth)
        let newOrigin = CGPoint(x: (newSize.width - self.size.width) / 2, y: (newSize.height - self.size.height) / 2)
        UIGraphicsBeginImageContextWithOptions(newSize, true, 1.0)
        self.draw(in: CGRect(origin: newOrigin, size: self.size))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
    
    func compressed() -> UIImage {
        if size.width < 1000 || size.height < 1000 { return self }
        let destinationSize = CGSize(width: size.width / 2, height: size.height / 2)
        UIGraphicsBeginImageContext(destinationSize)
        self.draw(in: CGRect(x: 0, y: 0, width: destinationSize.width, height: destinationSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
}
