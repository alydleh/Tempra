//
//  Pulse.swift
//  RedApp_wFrontEnd
//
//  Created by Stephanie Chou on 12/4/18.
//  Copyright © 2018 2.009RED. All rights reserved.
//

import UIKit
import QuartzCore

class Pulse: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let pulseAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        pulseAnimation.duration = 1
        pulseAnimation.fromValue = 0
        pulseAnimation.toValue = 1
        pulseAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = .greatestFiniteMagnitude
        view.layer.add(pulseAnimation, forKey: "animateOpacity")
    }

    
}
