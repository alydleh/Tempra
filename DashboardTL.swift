//
//  DashboardTL.swift
//  RedApp_wFrontEnd
//
//  Created by Stephanie Chou on 12/3/18.
//  Copyright © 2018 2.009RED. All rights reserved.
//

import UIKit
import AWSIoT
import QuartzCore
class DashboardTL: UIViewController {
    
    //setting up the timer label
  
    @IBOutlet weak var timerLabel: UILabel!
    
    //****START******************///////////////////
    //    @IBOutlet var tempLabelView: UIView!
    var ok_clicked = false
    var ingredientsData=IngredientsData()
    //linked view behind the burner
    
    @IBOutlet weak var burnerTest: RadialGradientView!
    //image for the burner itself
    @IBOutlet weak var burnerCircle: UIImageView!
    
    
    func burnerSetup()
    {
        burnerTest.backgroundColor = UIColor.clear
        view.addSubview(burnerTest)
        burnerCircle.image = UIImage(named:"greycircle.png")
        
    }
    
    func ok_update(action: UIAlertAction){
        self.ok_clicked = true
        //        print("ok_update3!!!!!!!!!!!!!!!: ", ok_clicked)
    }
    
//    func burnerUpdate(_ temp:Float)
//    {
//
//        //if the a base was selected + it's above the smoke point
//        if BasesControllerTL.oilSelected.values.contains(true) { //
//
//            let b = BasesControllerTL.oilSelected.filter {$0.value == true}
//            let key = b.keys.first
//
//            if globalVars.temps[1] >= ingredientsData.smokePoint(key!)
//            {
//
//                burnerCircle.image = UIImage(named:"redcircle.png")
//                //make the image red
//                burnerTest.updateBurner(temp, key!)
//
//                burnerPulse(0.3)
//
//                //alert notification
//                //print(self.ok_clicked)
//
////                if (self.ok_clicked==false){
////
////                    let myAlert = UIAlertController(title:"Alert",message: "You are above the smoke point!", preferredStyle:UIAlertController.Style.alert)
////
////                    let okAction = UIAlertAction(title: "OK",style: UIAlertAction.Style.default, handler: self.ok_update)
////                    //                print("ok_update1: ")
////                    //                print(ok_clicked)
////                    //{(ACTION) in print("Ok button tapped")}
////
////                    myAlert.addAction(okAction)
////                    self.present(myAlert, animated:true,completion:nil)
////                    //                print("ok_update2: ")
////                    //                print(ok_clicked)
////
////                }
//                //
//            }
//
//
//            else if globalVars.temps[1] >= 100{
//                //self.ok_clicked = false
//                burnerCircle.image = UIImage(named:"whitecircle.png")
//                //make the image white
//                burnerTest.updateBurner(temp, key!)
//                burnerPulse(1.0)
//            }
//            else if globalVars.temps[1] < 100{
//                self.ok_clicked = false
//                burnerCircle.image = UIImage(named:"greycircle.png")
//                //make the image white
//                burnerTest.updateBurner(temp, key!)
//                burnerPulse(1.0)
//
//            }
//        }
//
//            //base hasn't been selected and it's off
//        else if globalVars.temps[1] < 100
//        {
//            burnerCircle.image = UIImage(named:"greycircle.png")
//            burnerTest.updateBurner(temp, "None")
//            burnerPulse(1.0)
//
//            //update gradient
//        }
//
//            //base hasn't been selected and it's on
//        else if globalVars.temps[1] >= 100 //check that you don't have to check that a base hasn't been selected
//        {
//            burnerCircle.image = UIImage(named:"whitecircle.png")
//            //make the image white
//            burnerTest.updateBurner(temp, "None")
//            burnerPulse(1.0)
//
//        }
//
//    }
    func burnerUpdate(_ temp:Float,_ burner:Int){
        
        
        
        
        let intTemp=Int(temp) //temp in integer form
        //a base and and food selected
        if  ingredientsData.isBaseSelected(burner)==true && ingredientsData.isFoodSelected(burner)==true
        {
            
            let basekey = ingredientsData.findBaseSelected(burner)
            let foodkey = ingredientsData.findFoodSelected(burner)
            
            //if it's above the smoke point
            if intTemp >=  ingredientsData.smokePoint(basekey)
            {
                
                burnerCircle.image = UIImage(named:"redcircle.png")
                //make the image red
                burnerTest.updateBurner(temp, basekey)
                
                burnerPulse(0.3) }
                
                //if it's in the "good" cooking range
            else if ingredientsData.lowTemp(foodkey) <= intTemp && intTemp <= ingredientsData.highTemp(foodkey)
            {
                burnerCircle.image = UIImage(named:"greencircle.png")
                //make the image white
                burnerTest.updateBurner(temp, basekey)
                burnerPulse(1.0)
            }
                
                //if it's "off"
            else if intTemp < 100
            {
                burnerCircle.image = UIImage(named:"greycircle.png")
                //make the image white
                burnerTest.updateBurner(temp, basekey)
                burnerPulse(1.0)
            }
            else
            {
                burnerCircle.image = UIImage(named:"whitecircle.png")
                //make the image white
                burnerTest.updateBurner(temp, basekey)
                burnerPulse(1.0)
            }
            
            
        }
            //base has been selected but no food
            
        else if ingredientsData.isBaseSelected(burner)==true && ingredientsData.isFoodSelected(burner)==false
        {
            
            let key = ingredientsData.findBaseSelected(burner)
            
            if intTemp >= ingredientsData.smokePoint(key)
            {
                
                burnerCircle.image = UIImage(named:"redcircle.png")
                //make the image red
                burnerTest.updateBurner(temp, key)
                
                burnerPulse(0.3) }
            else if intTemp >= 100{
                //self.ok_clicked = false
                burnerCircle.image = UIImage(named:"whitecircle.png")
                //make the image white
                burnerTest.updateBurner(temp, key)
                burnerPulse(1.0)
            }
            else if intTemp < 100{
                self.ok_clicked = false
                burnerCircle.image = UIImage(named:"greycircle.png")
                //make the image white
                burnerTest.updateBurner(temp, key)
                burnerPulse(1.0)
                
            }
            
        }
            //food has been selected but base has not been selected
            
        else if ingredientsData.isBaseSelected(burner)==false && ingredientsData.isFoodSelected(burner)==true{
            
            let foodkey = ingredientsData.findFoodSelected(burner)
            
            if ingredientsData.lowTemp(foodkey) <= intTemp && intTemp <= ingredientsData.highTemp(foodkey)
            {
                burnerCircle.image = UIImage(named:"greencircle.png")
                //make the image white
                burnerTest.updateBurner(temp, "None")
                burnerPulse(1.0)
            }
            else if intTemp < 100
            {
                burnerCircle.image = UIImage(named:"greycircle.png")
                //make the image white
                burnerTest.updateBurner(temp, "None")
                burnerPulse(1.0)
            }
            else
            {
                burnerCircle.image = UIImage(named:"whitecircle.png")
                //make the image white
                burnerTest.updateBurner(temp, "None")
                burnerPulse(1.0)
            }
            
            
            
        }
            
            //if no food nor base have been selected
        else{
            if intTemp < 100 //if temp is below 100
            {
                burnerCircle.image = UIImage(named:"greycircle.png")
                burnerTest.updateBurner(temp, "None")
                burnerPulse(1.0)
                
            }
                
                
            else if intTemp >= 100 //if temp is above 100
            {
                burnerCircle.image = UIImage(named:"whitecircle.png")
                burnerTest.updateBurner(temp, "None")
                burnerPulse(1.0)
                
            }
            
        }
        
        
        
    }
    
    //function makes burner pulse when above smoke point. It's integrated in burnerUpdate function
    func burnerPulse(_ fromVal:Float)
    {
        
        let pulseAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        pulseAnimation.duration = 1.5
        pulseAnimation.fromValue = fromVal
        pulseAnimation.toValue = 1
        pulseAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = .greatestFiniteMagnitude
        burnerTest.layer.add(pulseAnimation, forKey: "animateOpacity")
        
    }
    
    
    //***END*******************///////////////////

    
    
    
    
    func updateTime()
    {
        self.timerLabel.text=SelectionScreenTL.timerTime
    }
    
   
    @IBOutlet weak var smokeView: UIView!
    @IBOutlet weak var foodView: UIView!
    
    @IBOutlet weak var baseImage: UIImageView!
    @IBOutlet weak var foodIcon: UIImageView!
    
    var chosenMeat = ""
    var chosenOil = ""
    var foodImage: [String:String] =
        ["Chicken":"25FRange.png",
         "Egg":"25FRange.png",
         "Fish":"50FRange.png",
         "Pork":"50FRange.png",
         "Steak":"50FRange.png"]
    
    func checkOil(){
        if BasesControllerTL.oilSelected.values.contains(true) == false {
            chosenOil = ""
            for subview in self.smokeView.subviews {
                subview.removeFromSuperview()
            }
            baseImage.image = UIImage(named:"foodiconhost.png")
            //            print("chosenMeat",chosenMeat)
            //            print("we are here swu and kaymie")
        }
        
        for (oil, tf) in BasesControllerTL.oilSelected{
//            print(oil,tf)
            if tf == true {
                chosenOil = oil
//                print("chosen oil",chosenOil)
            }
            
        }
        
        if chosenOil.count == 0 {
            for subview in self.smokeView.subviews {
                subview.removeFromSuperview()
            }
            baseImage.image = UIImage(named:"foodiconhost.png")
        }
        
        if chosenOil.count > 0{
            let imageName = "oilRange.png"
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image!)
            
            for subview in self.smokeView.subviews {
                subview.removeFromSuperview()
            }
            
            if chosenOil == "Olive Oil"{
                imageView.frame = CGRect(x: 283.5, y: 30, width: 19, height: 6) //Int((20+130*(425-350)/325)
                smokeView.addSubview(imageView)
                baseImage.image = UIImage(named:"Olive_unselected.png")

            }
                
            else if chosenOil == "Vegetable Oil"{
                imageView.frame = CGRect(x: 283.5, y: 30, width: 19, height: 6)
                smokeView.addSubview(imageView)
                baseImage.image = UIImage(named:"Vegetable_unselected.png")
            }
                
            else if chosenOil == "Sesame Oil"{
                imageView.frame = CGRect(x: 283.5, y: 50, width: 19, height: 6)
                smokeView.addSubview(imageView)
                baseImage.image = UIImage(named:"Sesame_unselected.png")
            }
                
            else if chosenOil == "Butter"{
                imageView.frame = CGRect(x: 283.5, y: 50, width: 19, height: 6)
                smokeView.addSubview(imageView)
                baseImage.image = UIImage(named:"Butter_unselected.png")
            }
            
            else if chosenOil == "Water"{
                baseImage.image = UIImage(named:"Water_unselected.png")
            }
            
            else if chosenOil == "None"{
                baseImage.image = UIImage(named:"None_unselected.png")
            }
            
        }
    }
        
    
    func checkMeat(){
        if FoodControllerTL.meatSelected.values.contains(true) == false {
            chosenMeat = ""
            for subview in self.foodView.subviews {
                subview.removeFromSuperview()
            }
            foodIcon.image = UIImage(named:"foodiconhost.png")
//            print("chosenMeat",chosenMeat)
//            print("we are here swu and kaymie")
        }
        
        for (food, tf) in FoodControllerTL.meatSelected{
//            print(food,tf)
            
            if tf == true {
                chosenMeat = food
//                print("chosenmeat",chosenMeat)
            }
            
        }
        
        
        if chosenMeat.count > 0 && chosenMeat != "Other" {
            let imageName = foodImage[chosenMeat]
            let image = UIImage(named: imageName!)
            let imageView = UIImageView(image: image!)
            
            for subview in self.foodView.subviews {
                subview.removeFromSuperview()
            }
            
            if chosenMeat == "Chicken"{
                imageView.frame = CGRect(x: 302.5, y: 50, width: 15.39, height: 10) //Int((20+130*(425-350)/325)
                foodView.addSubview(imageView)
                foodIcon.image = UIImage(named:"Chicken_unselected.png")

            }
            else if chosenMeat == "Egg"{
                imageView.frame = CGRect(x: 302.5, y: 80, width: 15.39, height: 10)
                foodView.addSubview(imageView)
                foodIcon.image = UIImage(named:"Egg_unselected.png")

            }
                
            else if chosenMeat == "Fish"{
                imageView.frame = CGRect(x: 302.5, y: 40, width: 15.39, height: 20)
                foodView.addSubview(imageView)
                foodIcon.image = UIImage(named:"Fish_unselected.png")

            }
            
            else if chosenMeat == "Pork"{
                imageView.frame = CGRect(x: 302.5, y: 40, width: 15.39, height: 20)
                foodView.addSubview(imageView)
                foodIcon.image = UIImage(named:"Pork_unselected.png")

            }
                
            else if chosenMeat == "Steak"{
                imageView.frame = CGRect(x: 302.5, y: 42, width: 15.39, height: 20)
                foodView.addSubview(imageView)
                foodIcon.image = UIImage(named:"Steak_unselected.png")
//                print("steak is here")

            }

        }
    }
    
    //temperature labels variables
    
        @IBOutlet weak var TopLeftBurnerTemp: UILabel!
    //    @IBOutlet weak var TopRightBurnerTemp: UILabel!
    //    @IBOutlet weak var BottomRightBurnerTemp: UILabel!
    //@IBOutlet weak var BottomLeftBurnerTemp: UILabel!
    
    
    
    
    
    
    
    //temp bar variables
    
        @IBOutlet weak var tempBarTL: UIView!
    //    @IBOutlet weak var tempBarTR: UIView!
//    @IBOutlet weak var tempBarBL: UIView!
    //    @IBOutlet weak var tempBarBR: UIView!
    
    
    
    var viewTimer: Timer? = nil //this was added
    
    func setLabel(){
        
        if globalVars.temps[1] < 100
        {
            TopLeftBurnerTemp.text="Off"
        }
            
        else if globalVars.temps[1] > 100 && BasesControllerTL.oilSelected.values.contains(true)  {
            
            if globalVars.temps.count>2{
                TopLeftBurnerTemp.text=String(globalVars.temps[1])
//                TopLeftBurnerTemp.sizeToFit()
            }
            
        }
            
        else
        {
            TopLeftBurnerTemp.text=""
        }
    }
    //this was added
    func stateChange(){
        if switchState.stateToBeChanged{
            print(Server.rpState)
            viewTimer!.invalidate()
            viewTimer = nil
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: switchState.viewControl)
            self.present(newViewController, animated: true, completion: nil)
        }
    }
    
    //this was added
    @objc func doThings(){
        globalVars()
        setLabel()
        switchState() // updates internal states
        stateChange()  //changes the storyboard accoringly --- carry this function over to EVERY UI view controller
        updateTime()
        setupViews(maxTemp: maxTemp)
        checkMeat()
        checkOil()
        burnerUpdate(Float(globalVars.temps[1]),1)

    }

    //make the progress bars
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
    
    let progressViewTL: VerticalProgressView = {
        let pvTL = VerticalProgressView()
        pvTL.translatesAutoresizingMaskIntoConstraints = false
        return pvTL
    }()
    
    let maxTemp = Float(325) //max right now 325 (Max is 425, 400 is smoke of olive oil, and don't show under 100)
    //var tempBR = Float(globalVars.temps[2]) // Float(Server.temps[2]) //
    var ratioTempTL = Float(0.0)


    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = switchState() //this was added
        _ = globalVars()
        _ = VerticalProgressView()
        publish()
        
        //**START********************///////////////////
        burnerSetup()
        view.addSubview(burnerCircle)
        //    tempLabelView.backgroundColor = UIColor.clear
        //        view.addSubview(tempLabelView)
        
        view.addSubview(TopLeftBurnerTemp)
        
        //**END********************///////////////////
        
        setLabel()
        // updates internal states
        stateChange()  //changes the storyboard accoringly --- carry this function over to EVERY UI view controller
        updateTime()
        setupViews(maxTemp: maxTemp)
        checkMeat()
        checkOil()
        burnerUpdate(Float(globalVars.temps[1]),1)


        //to update label with timer time
  //      _ = Timer.scheduledTimer(timeInterval: 0.5,target: self,selector: #selector(self.updateTime),userInfo: nil, repeats: true)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewTimer = Timer.scheduledTimer(timeInterval: 0.5,target: self,selector: #selector(self.doThings),userInfo: nil, repeats: true)
        // this was changed
    }
    
    
    //private func setupViews(tempTL: Float, tempTR: Float, tempBR: Float, tempBL: Float) {
    func setupViews(maxTemp: Float) {
        
        //Getting the right temperature and scaling
        //arbitrary picking
        var tempTL = Float(globalVars.temps[1] - 100) // Float(Server.temps[2]) //
        let myColor = UIColor(red: CGFloat(248)/255, green: CGFloat(138)/255, blue: CGFloat(122)/255, alpha: CGFloat(1.0))
        if tempTL < maxTemp {
            //print ("temp BR is less than max")
            var ratioTempTL = Float(tempTL/maxTemp)
            //print (ratioTempBR)
            
            tempBarTL.addSubview(progressViewTL)
            progressViewTL.centerXAnchor.constraint(equalTo: tempBarTL.centerXAnchor).isActive = true
            progressViewTL.centerYAnchor.constraint(equalTo: tempBarTL.centerYAnchor).isActive = true
            progressViewTL.widthAnchor.constraint(equalToConstant: 130).isActive = true
            progressViewTL.heightAnchor.constraint(equalToConstant: 5).isActive = true
            //change the height
            progressViewTL.setProgress(ratioTempTL, animated: true)
            progressViewTL.progressTintColor = myColor
            
        } else {
            //print ("temp is greater than max 550")
            let ratioTempTL = Float(1.0)
            tempBarTL.addSubview(progressViewTL)
            progressViewTL.centerXAnchor.constraint(equalTo: tempBarTL.centerXAnchor).isActive = true
            progressViewTL.centerYAnchor.constraint(equalTo: tempBarTL.centerYAnchor).isActive = true
            progressViewTL.widthAnchor.constraint(equalToConstant: 130).isActive = true
            progressViewTL.heightAnchor.constraint(equalToConstant: 5).isActive = true
            //change the height
            progressViewTL.setProgress(ratioTempTL, animated: true)
            progressViewTL.progressTintColor = myColor
            
        }
        
        
    }
    
    
}
