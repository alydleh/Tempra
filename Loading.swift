//
//  LoadingScreen.swift
//  RedApp_wFrontEnd
//
//  Created by Megan :) on 12/3/18.
//  Copyright © 2018 2.009RED. All rights reserved.
//
import UIKit
import AWSIoT
class loading: UIViewController {
    var viewTimer: Timer? = nil //this was added
    var changedState: Bool = false //this was added
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var _ = Server()
        // Do any additional  setup after loading the view, typically from a nib.
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewTimer = Timer.scheduledTimer(timeInterval: 2,target: self,selector: #selector(self.doThings),userInfo: nil, repeats: true)
        // this was changed
    }
    
    @objc func doThings(){
        switchState()  // updates internal states
        stateChange()  //changes the storyboard accoringly --- carry this function over to EVERY UI view controller
        publish()
    }
    @objc func stateChange(){
        if switchState.stateToBeChanged{
            print(Server.rpState)
            viewTimer!.invalidate()
            viewTimer = nil
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: switchState.viewControl)
            self.present(newViewController, animated: true, completion: nil)
        }
    }
    func publish(){
        print("publishing")
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
