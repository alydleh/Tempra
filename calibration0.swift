//
//  calibration0.swift
//  RedApp_wFrontEnd
//
//  Created by Weerachai Neeranartvong on 12/9/18.
//  Copyright © 2018 2.009RED. All rights reserved.
//

import UIKit
import Foundation
import AWSIoT

class calibration0: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        switchState.state = 1
        Server.calibrate = 0
        publish()
    }
    
    func publish(){
        let iotDataManager = AWSIoTDataManager(forKey: ASWIoTDataManager)
        let dic: [String:Any] = [
            "state" : switchState.state,
            "numBurners" : Server.numBurn,
            "calibration" : Server.calibrate,
            "alert" : Server.alert,
            ]
        if let theJSONData = try? JSONSerialization.data(
            withJSONObject: dic,
            options: []) {
            let json = String(data: theJSONData,
                              encoding: .ascii)
            //  print("JSON string = \(json!)")
            iotDataManager.publishString(json!, onTopic: "appToRp", qoS:.messageDeliveryAttemptedAtMostOnce)
        }
    }
    
}
