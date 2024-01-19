//
//  StateChange.swift
//  RedApp_wFrontEnd
//
//  Created by Megan :) on 12/2/18.
//  Copyright © 2018 2.009RED. All rights reserved.
//

import Foundation
import AWSIoT

class switchState{
    static var viewControl = "dashboard"
    static var state = 2
    static var stateToBeChanged: Bool = false
    
    init() {
        let rpState = Server.rpState
        let rpCalib = Server.rpCalibrate
        var state = type(of: self).state

        switch state {
        case 0:
            if rpState == 1 && type(of: self).state != 1 && Server.rpCalibrate != 3{
                state = 1
                type(of: self).state = 1
                type(of: self).viewControl = "calibration0"
                type(of: self).stateToBeChanged = true
            }else {
                
                type(of: self).stateToBeChanged = false
            }
            break
        case 1:
            if rpCalib == 3 && type(of: self).state != 0{
                type(of: self).viewControl = "calibration5"
                type(of: self).stateToBeChanged = true
                print(type(of: self).viewControl)
            }else {
                type(of: self).stateToBeChanged = false
            }

            break
        case 2:
            if rpState == 0 && type(of: self).state != 0{
                state = 0
                type(of: self).state=0
                type(of: self).viewControl = "dashboard"
                type(of: self).stateToBeChanged = true
                
            }
            else if rpState == 1 && type(of: self).state != 1{
                state = 1
                type(of: self).state=1
                type(of: self).viewControl = "calibration0"
                type(of: self).stateToBeChanged = true
                
            }else {
                
                type(of: self).stateToBeChanged = false
            }

            break
        default:
            if rpState == 0{
                state = 0
                type(of: self).state=0
                type(of: self).viewControl = "dashboard"
                type(of: self).stateToBeChanged = true
            }
            else if rpState == 1{
                state = 1
                type(of: self).state=1
                type(of: self).viewControl = "calibration0"
                type(of: self).stateToBeChanged = true
            }else {
                
                type(of: self).stateToBeChanged = false
            }

        }
    }
}
