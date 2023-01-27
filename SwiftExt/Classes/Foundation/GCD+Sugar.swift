//
//  GCD+Sugar.swift
//  Tune2Love
//
//  Created by Valik Kuchinsky on 07.02.2018.
//  Copyright © 2018 Tune2Love. All rights reserved.
//

import Foundation

let defaultDelay: Double = 0.3
let noDelay: Double = 0.0

func scheduleOnMainQueueAfter(delay: Double, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

