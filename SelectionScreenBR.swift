//
//  SelectionScreenBR.swift
//  RedApp_wFrontEnd
//
//  Created by Aly Huerta on 12/5/18.
//  Copyright © 2018 2.009RED. All rights reserved.
//

import UIKit
import AWSIoT

class SelectionScreenBR: UIViewController {
    
    //setting up the links for the ingredients switch functionality
  
    @IBOutlet weak var mySwitch: UISegmentedControl!
    
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var meatView: UIView!
    //meat view
    /////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(type(of:self).isTimerRunning)
        if type(of:self).isTimerRunning==true
        {
            stopWatchPicker.isEnabled = false
            startButton.isEnabled = false
            stopWatchPicker.countDownDuration = 60.0;
        }
        else
        {
            stopWatchPicker.countDownDuration = 60.0;
            pauseButton.isEnabled = false
        }
        
        
        //the following changes the font properties of the switch////
//        let attr = NSDictionary(object: UIFont(name: "SF Pro Display Ultralight", size: 16.0)!, forKey: NSAttributedString.Key.font as NSCopying)
//        mySwitch.setTitleTextAttributes(attr as [NSObject : AnyObject] as [NSObject : AnyObject] as? [NSAttributedString.Key : Any] , for: .normal)
        ///////////
    }
    
    
    //linking switch button /////////////////
    
        
   
    @IBAction func switchViewAction(_ sender: UISegmentedControl) {
   
    if sender.selectedSegmentIndex == 0
        {
            baseView.isHidden = false
            meatView.isHidden = true
        }
        else
        {
            baseView.isHidden = true
            meatView.isHidden = false
        }
        
    }
    
    
    //timer code////////////////////////////
    
    static var timerTime="00:00:00" //stores timer value to use across multiple views
    
    static var countdownSeconds:Int = 0
    
    
   
    @IBOutlet weak var stopWatchPicker: UIDatePicker!
   
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    
    
    
    
    //    //    var seconds = 60
    static var timer = Timer() //check this?????
    static var isTimerRunning = false
    static var resumeTapped = false
    
    
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
   
        //when the startButton is tapped
        type(of:self).countdownSeconds = Int(stopWatchPicker.countDownDuration)
        stopWatchPicker.isEnabled = false
        pauseButton.isEnabled=true
        //        timerLabel.isHidden = false
        if type(of:self).isTimerRunning == false { //and if the Timer isn't running
            runTimer() //run the timer
            self.startButton.isEnabled = false //disable the start button
            print("The start button has been pressed")
        }
    }
    
    func runTimer() { //fire the timer
        type(of:self).timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(SelectionScreenTL.updateTimer)), userInfo: nil, repeats: true)
        type(of:self).isTimerRunning = true //now timer is running
        pauseButton.isEnabled = true //enable pause button
        print("The timer has been fired")
    }
    
    
    
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
   
        
        //if pauseButton is tapped
        
        print("resume")
        print(type(of:self).resumeTapped)
        print("countdown seconds")
        print(type(of:self).countdownSeconds)
        
        if type(of:self).resumeTapped == false { //if the resume button is not activated in place of the pause button
            type(of:self).timer.invalidate() //stop the timer
            type(of:self).isTimerRunning = false //since we paused the timer, the timer is no longer running
            type(of:self).resumeTapped = true//enable the resume button
            print("resume")
            print(type(of:self).resumeTapped)
            self.pauseButton.setTitle("Resume",for: .normal) //set the text of the pause button to resume
        }
        else { //if instead the resume button is enabled
            runTimer() //then if the "pause" button is tapped, then run the timer
            type(of:self).resumeTapped = false//set the resume button to be false
            print("resume")
            print(type(of:self).resumeTapped = false)
            type(of:self).isTimerRunning = true //now the timer is running
            self.pauseButton.setTitle("Pause",for: .normal) //set the title of this button to be "pause"
        }
    }
    //
    
    
  
   
    @IBAction func resetButtonTapped(_ sender: UIButton) {
   
        
        //if reset button is tapped
        type(of:self).timer.invalidate() //stop the timer
        //        seconds = 60
        //        timerLabel.text = "\(seconds)"
        //        timerLabel.text = timeString(time: TimeInterval(seconds))
        //        originalSelected = minutesSelected*60 + secondsSelected
        //        timerLabel.text = timeString(time: TimeInterval(originalSelected)) //update the timer label with the nice format of "0:00"
        type(of:self).isTimerRunning = false //now the timer is not running
        //        pauseButton.isEnabled = false
        //        startButton.isEnabled = true
        stopWatchPicker.isEnabled = true
        //        timerLabel.isHidden = true
        startButton.isEnabled = true
        pauseButton.isEnabled=false
        pauseButton.setTitle("Pause",for: .normal)
        type(of:self).timerTime = "00:00:00"
    }
    
    //    func convertToSeconds(minutesSelected:Int, secondsSelected:Int) {
    //        countdownSeconds = minutesSelected*60 + secondsSelected
    //    }
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
    
    @objc func updateTimer() {
        print("beg:",type(of:self).countdownSeconds)
        if type(of:self).countdownSeconds == 0 {
            type(of:self).timer.invalidate()
            type(of:self).timerTime = timeString(time: TimeInterval(type(of:self).countdownSeconds))
            globalVars.alertArray[2] = 0
            //Send alert to indicate time's up.
            publish()
        }else if type(of:self).countdownSeconds == 1 {
            
            type(of:self).timerTime = timeString(time: TimeInterval(type(of:self).countdownSeconds)) //alyda - stores timer value for use in other viewers
            type(of:self).countdownSeconds -= 1 //subtract
            globalVars.alertArray[2] = 1
            publish()
            print(type(of:self).timerTime)
        }
        else {
            
            type(of:self).timerTime = timeString(time: TimeInterval(type(of:self).countdownSeconds)) //alyda - stores timer value for use in other viewers
            type(of:self).countdownSeconds -= 1 //subtract
            print(type(of:self).timerTime)
        }
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600 % 60
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
        
    }
    /////////////////////////////////////////////////////////
    
    
}

