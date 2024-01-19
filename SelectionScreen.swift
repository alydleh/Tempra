//
//  SelectionScreen.swift
//  RedApp_wFrontEnd
//
//  Created by Aly Huerta on 11/29/18.
//  Copyright © 2018 2.009RED. All rights reserved.
//

import UIKit
//import CocoaMQTT //to publish information
class SelectionScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stopWatchPicker.countDownDuration = 60.0;
        pauseButton.isEnabled = false
//        print(stopWatchPicker.countDownDuration)
    }
    
    
    //creating a dictionary to store what ingredients have been selected
    static var ingredientsSelectedMeat: [String:Bool] =
    ["Chicken":false,
    "Egg":false,
    "Fish":false,
    "Ham":false,
    "Steak":false,
    "Other":false]
    
    static var ingredientsSelectedOil: [String:Bool] =
        ["Olive Oil":false,
         "Vegetable Oil":false,
         "Sesame Oil":false,
         "Butter":false,
         "Water":false,
         "None":false]
    
    
   
    
    @IBOutlet weak var oliveOilIcon: UIButton!
    @IBOutlet weak var vegetableOilIcon: UIButton!
    
    
    
    

    
    //ingredient selections
    //need to add changing color
    
    
    
        
    @IBAction func oliveOilButton(_ sender: Any) {
   
    if type(of:self).ingredientsSelectedOil["Olive Oil"]==true
        {
            type(of:self).ingredientsSelectedOil["Olive Oil"]=false
             oliveOilIcon.setImage(UIImage(named:"Olive_unselected.png"),for: .normal)
        }
        else
        {
           type(of:self).ingredientsSelectedOil["Olive Oil"]=true
            oliveOilIcon.setImage(UIImage(named:"Olive_selected.png"),for: .normal)
        }
    }
    
    
   
    
    @IBAction func vegetableOilButton(_ sender: Any) {
    
    if type(of:self).ingredientsSelectedOil["Vegetable Oil"]==true
        {
            type(of:self).ingredientsSelectedOil["Vegetable Oil"]=false
        }
        else
        {
            type(of:self).ingredientsSelectedOil["Vegetable Oil"]=true
        }
    }
    
    
    
    @IBAction func sesameOilButton(_ sender: Any) {
    if type(of:self).ingredientsSelectedOil["Sesame Oil"]==true
        {
            type(of:self).ingredientsSelectedOil["Sesame Oil"]=false
        }
        else
        {
            type(of:self).ingredientsSelectedOil["Sesame Oil"]=true
        }
    }
    
    
    
    @IBAction func butterButton(_ sender: Any) {
    if type(of:self).ingredientsSelectedOil["Butter"]==true
        {
            type(of:self).ingredientsSelectedOil["Butter"]=false
        }
        else
        {
            type(of:self).ingredientsSelectedOil["Butter"]=true
        }
    }

    
 
    @IBAction func waterButton(_ sender: Any) {
    if type(of:self).ingredientsSelectedOil["Water"]==true
        {
            type(of:self).ingredientsSelectedOil["Water"]=false
        }
        else
        {
            type(of:self).ingredientsSelectedOil["Water"]=true
        }
    }
    
    
    
    @IBAction func noneButton(_ sender: Any) {
    if type(of:self).ingredientsSelectedOil["None"]==true
        {
            type(of:self).ingredientsSelectedOil["None"]=false
        }
        else
        {
            type(of:self).ingredientsSelectedOil["None"]=true
        }
    }
    
    
    @IBAction func chickenButton(_ sender: Any) {

    if type(of:self).ingredientsSelectedMeat["Chicken"]==true
        {
            type(of:self).ingredientsSelectedMeat["Chicken"]=false
        }
        else
        {
            type(of:self).ingredientsSelectedMeat["Chicken"]=true
        }
    }
    
    
    @IBAction func eggButton(_ sender: Any) {
    
    if type(of:self).ingredientsSelectedMeat["Egg"]==true
        {
            type(of:self).ingredientsSelectedMeat["Egg"]=false
        }
        else
        {
            type(of:self).ingredientsSelectedMeat["Egg"]=true
        }
    }
    
    
    
    @IBAction func fishButton(_ sender: Any) {
    
    if type(of:self).ingredientsSelectedMeat["Fish"]==true
        {
            type(of:self).ingredientsSelectedMeat["Fish"]=false
        }
        else
        {
            type(of:self).ingredientsSelectedMeat["Fish"]=true
        }
    }

   
    @IBAction func hamButton(_ sender: Any) {
    if type(of:self).ingredientsSelectedMeat["Ham"]==true
        {
            type(of:self).ingredientsSelectedMeat["Ham"]=false
        }
        else
        {
            type(of:self).ingredientsSelectedMeat["Ham"]=true
        }
    }
    
    
   
    @IBAction func steakButton(_ sender: Any) {
    if type(of:self).ingredientsSelectedMeat["Steak"]==true
        {
            type(of:self).ingredientsSelectedMeat["Steak"]=false
        }
        else
        {
            type(of:self).ingredientsSelectedMeat["Steak"]=true
        }
    }
    
    @IBAction func otherButton(_ sender: Any) {
    if type(of:self).ingredientsSelectedMeat["Other"]==true
        {
            type(of:self).ingredientsSelectedMeat["Other"]=false
        }
        else
        {
            type(of:self).ingredientsSelectedMeat["Other"]=true
        }
    }
    
    
    
    //timer code///////////////////////////////////////////////////////
   
   
//    var minutesSelected:Int = 0
//    var secondsSelected:Int = 0
    var countdownSeconds:Int = 0
//    var originalSelected:Int = 0
    
    
    @IBOutlet weak var stopWatchPicker: UIDatePicker!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    

    
    //    //    var seconds = 60
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false


    var timerTime="hi" //stores timer value to use across multiple views
    
   
    @IBAction func startButtonTapped(_ sender: UIButton) {//when the startButton is tapped
    countdownSeconds = Int(stopWatchPicker.countDownDuration)
        stopWatchPicker.isEnabled = false
//        timerLabel.isHidden = false
        if isTimerRunning == false { //and if the Timer isn't running
            runTimer() //run the timer
            self.startButton.isEnabled = false //disable the start button
            print("The start button has been pressed")
        }
    }

    func runTimer() { //fire the timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(SelectionScreen.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true //now timer is running
        pauseButton.isEnabled = true //enable pause button
        print("The timer has been fired")
    }


    
    @IBAction func pauseButtonTapped(_ sender: UIButton) {//if pauseButton is tapped
    if self.resumeTapped == false { //if the resume button is not activated in place of the pause button
            timer.invalidate() //stop the timer
            isTimerRunning = false //since we paused the timer, the timer is no longer running
            self.resumeTapped = true //enable the resume button
            self.pauseButton.setTitle("Resume",for: .normal) //set the text of the pause button to resume
        }
        else { //if instead the resume button is enabled
            runTimer() //then if the "pause" button is tapped, then run the timer
            self.resumeTapped = false //set the resume button to be false
            isTimerRunning = true //now the timer is running
            self.pauseButton.setTitle("Pause",for: .normal) //set the title of this button to be "pause"
        }
    }
//
   

    @IBAction func resetButtonTapped(_ sender: UIButton) {//if reset button is tapped
    timer.invalidate() //stop the timer
        //        seconds = 60
        //        timerLabel.text = "\(seconds)"
        //        timerLabel.text = timeString(time: TimeInterval(seconds))
//        originalSelected = minutesSelected*60 + secondsSelected
//        timerLabel.text = timeString(time: TimeInterval(originalSelected)) //update the timer label with the nice format of "0:00"
        isTimerRunning = false //now the timer is not running
        //        pauseButton.isEnabled = false
        //        startButton.isEnabled = true
        stopWatchPicker.isEnabled = true
//        timerLabel.isHidden = true
        startButton.isEnabled = true
        pauseButton.setTitle("Pause",for: .normal)
        timerLabel.text = "00:00:00"
    }

    //    func convertToSeconds(minutesSelected:Int, secondsSelected:Int) {
    //        countdownSeconds = minutesSelected*60 + secondsSelected
    //    }


    @objc func updateTimer() {
        print("beg:",countdownSeconds)
        if countdownSeconds == 0 {
            timer.invalidate()
            timerLabel.text = timeString(time: TimeInterval(countdownSeconds)) //update the timer label with the
            //Send alert to indicate time's up.
        } else {
            timerLabel.text = timeString(time: TimeInterval(countdownSeconds)) //update the timer label with the nice format of "0:00"
            self.timerTime = timeString(time: TimeInterval(countdownSeconds)) //alyda - stores timer value for use in other viewers
            countdownSeconds -= 1 //subtract
            //            timerLabel.text = "\(seconds)"
            //            print(timerTime)
            print("counting down:",countdownSeconds)
            //            timerLabel.text = String(seconds)
            ////            timerLabel.setTitle(timeString(time: TimeInterval(seconds)), for: UIControl.State.normal)
            print(timerTime)
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


    
    


    


