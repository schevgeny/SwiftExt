//
//  CGPoint+ext.swift
//  LocationTracker
//
//  Created by Eugene sch on 20.04.22.
//

import Foundation

extension CGPoint {
    func distance(to point: CGPoint) -> CGFloat {
        return sqrt(pow((point.x - x), 2) + pow((point.y - y), 2))
    }
}
