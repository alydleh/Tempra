//
//  Dashboard.swift
//  RedApp_wFrontEnd
//
//  Created by Aly Huerta on 11/29/18.
//  Copyright © 2018 2.009RED. All rights reserved.
//
import UIKit
class Dashboard: UIViewController {
    
//    //temperature labels variables
//    @IBOutlet weak var TopLeftBurnerTemp: UILabel!
//    @IBOutlet weak var TopRightBurnerTemp: UILabel!
//    @IBOutlet weak var BottomRightBurnerTemp: UILabel!
//    @IBOutlet weak var BottomLeftBurnerTemp: UILabel!
    
    
    
   
   

    
//    //temp bar variables
//
//    @IBOutlet weak var tempBarTL: UIView!
//    @IBOutlet weak var tempBarTR: UIView!
//    @IBOutlet weak var tempBarBL: UIView!
//    @IBOutlet weak var tempBarBR: UIView!
    
   


    
   
    
//
//    var viewTimer: Timer? = nil //this was added
//    var changedState: Bool = false //this was added
//    var server=Server()
//    var this = switchState() //this was added
//
//    @objc func setLabel(){
//        if Server.temps.count != 0
//        {if Server.temps[0]>=100{
//            let i = Int(round(Server.temps[0]/100*20)/20*100)
//            TopLeftBurnerTemp.text=String(i)
//            TopLeftBurnerTemp.sizeToFit()
//        }else{
//            let i = Int(round(Server.temps[0]/10*20)/20*10)
//            TopLeftBurnerTemp.text=String(i)
//            TopLeftBurnerTemp.sizeToFit()
//            }
//        }
//        if Server.temps.count>1{
//            if Server.temps[0]>=100{
//                let i = Int(round(Server.temps[0]/100*20)/20*100)
//                TopLeftBurnerTemp.text=String(i)
//                TopLeftBurnerTemp.sizeToFit()
//            }else{
//                let i = Int(round(Server.temps[0]/10*20)/20*10)
//                TopLeftBurnerTemp.text=String(i)
//                TopLeftBurnerTemp.sizeToFit()
//            }
//        }
//        if Server.temps.count>2{
//            if Server.temps[0]>=100{
//                let i = Int(round(Server.temps[0]/100*20)/20*100)
//                TopLeftBurnerTemp.text=String(i)
//                TopLeftBurnerTemp.sizeToFit()
//            }else{
//                let i = Int(round(Server.temps[0]/10*20)/20*10)
//                TopLeftBurnerTemp.text=String(i)
//                TopLeftBurnerTemp.sizeToFit()
//            }
//        }
//        if Server.temps.count>3{
//            if Server.temps[0]>=100{
//                let i = Int(round(Server.temps[0]/100*20)/20*100)
//                TopLeftBurnerTemp.text=String(i)
//                TopLeftBurnerTemp.sizeToFit()
//            }else{
//                let i = Int(round(Server.temps[0]/10*20)/20*10)
//                TopLeftBurnerTemp.text=String(i)
//                TopLeftBurnerTemp.sizeToFit()
//            }
//
//        }
//    }
//    //this was added
//    @objc func stateChange(){
//        if Server.stateToBeChanged{
//            print(Server.rpState)
//            viewTimer!.invalidate()
//            viewTimer = nil
//            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let newViewController = storyBoard.instantiateViewController(withIdentifier: switchState.viewControl)
//            self.present(newViewController, animated: true, completion: nil)
//            Server.stateToBeChanged=false
//        }
//    }
//
//    //this was added
//    @objc func doThings(){
//        setLabel()  //updates UIlabels
//  //      switchState()  // updates internal states
//        stateChange()  //changes the storyboard accoringly --- carry this function over to EVERY UI view controller
//    }
//
//
//    //variables of temperatures
////    let maxTemp = Float(550) //max right now 550
//    var tempTL = Float(0.1) //Float(Server.temps[0]) //
//    var tempTR = Float(0.1) //Float(Server.temps[1]) //
//    var tempBL = Float(0.1) // Float(Server.temps[2]) //
//    var tempBR = Float(0.1) //Float(Server.temps[3]) //
////    var ratioTempTL = Float(0.0)
//
////    if tempTL < maxTemp {
////         ratioTempTL = Float(tempTL/maxTemp)
////    }
////    else {
////         ratioTempTL = Float(1.0)
////    }
////
////    if tempTL < maxTemp {
////    var ratioTempTL = Float(tempTL/maxTemp)
////    }
////    else {
////    var ratioTempTL = Float(1.0)
////    }
////
////    if tempTL < maxTemp {
////    var ratioTempTL = Float(tempTL/maxTemp)
////    }
////    else {
////    var ratioTempTL = Float(1.0)
////    }
////
////    if tempTL < maxTemp {
////    var ratioTempTL = Float(tempTL/maxTemp)
////    }
////    else {
////    var ratioTempTL = Float(1.0)
////    }
//
//    //make the progress bars
//    let progressViewTL: VerticalProgressView = {
//        let pvTL = VerticalProgressView()
//        pvTL.translatesAutoresizingMaskIntoConstraints = false
//        return pvTL
//    }()
//
//    let progressViewTR: VerticalProgressView = {
//        let pvTR = VerticalProgressView()
//        pvTR.translatesAutoresizingMaskIntoConstraints = false
//        return pvTR
//    }()
//
//    let progressViewBL: VerticalProgressView = {
//        let pvBL = VerticalProgressView()
//        pvBL.translatesAutoresizingMaskIntoConstraints = false
//        return pvBL
//    }()
//
//    let progressViewBR: VerticalProgressView = {
//        let pvBR = VerticalProgressView()
//        pvBR.translatesAutoresizingMaskIntoConstraints = false
//        return pvBR
//    }()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupViews(tempTL: tempTL, tempTR: tempTR, tempBR: tempBR, tempBL: tempBL)
//
//    }
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        viewTimer = Timer.scheduledTimer(timeInterval: 0.5,target: self,selector: #selector(self.setLabel),userInfo: nil, repeats: true)
//        // this was changed
//    }
//
//
//    //private func setupViews(tempTL: Float, tempTR: Float, tempBR: Float, tempBL: Float) {
//    func setupViews(tempTL: Float, tempTR: Float, tempBR: Float, tempBL: Float) {
//        tempBarTL.addSubview(progressViewTL)
//        progressViewTL.centerXAnchor.constraint(equalTo: tempBarTL.centerXAnchor).isActive = true
//        progressViewTL.centerYAnchor.constraint(equalTo: tempBarTL.centerYAnchor).isActive = true
//        progressViewTL.widthAnchor.constraint(equalToConstant: 120).isActive = true
//        progressViewTL.heightAnchor.constraint(equalToConstant: 30).isActive = true
//
//        //change the height
//        progressViewTL.setProgress(tempTL, animated: true)
//        progressViewTL.progressTintColor = .red
//
//        //Top Right
//        tempBarTR.addSubview(progressViewTR)
//        progressViewTR.centerXAnchor.constraint(equalTo: tempBarTR.centerXAnchor).isActive = true
//        progressViewTR.centerYAnchor.constraint(equalTo: tempBarTR.centerYAnchor).isActive = true
//        progressViewTR.widthAnchor.constraint(equalToConstant: 120).isActive = true
//        progressViewTR.heightAnchor.constraint(equalToConstant: 20).isActive = true
//        //change the height
//        progressViewTR.setProgress(tempTR, animated: true)
//        progressViewTR.progressTintColor = .red
//
//        //Bottom Left
//        tempBarBL.addSubview(progressViewBL)
//        progressViewBL.centerXAnchor.constraint(equalTo: tempBarBL.centerXAnchor).isActive = true
//        progressViewBL.centerYAnchor.constraint(equalTo: tempBarBL.centerYAnchor).isActive = true
//        progressViewBL.widthAnchor.constraint(equalToConstant: 120).isActive = true
//        progressViewBL.heightAnchor.constraint(equalToConstant: 20).isActive = true
//        //change the height
//        progressViewBL.setProgress(tempBL, animated: true)
//        progressViewBL.progressTintColor = .red
//
//
//        //Bottom Right
//        tempBarBR.addSubview(progressViewBR)
//        progressViewBR.centerXAnchor.constraint(equalTo: tempBarBR.centerXAnchor).isActive = true
//        progressViewBR.centerYAnchor.constraint(equalTo: tempBarBR.centerYAnchor).isActive = true
//        progressViewBR.widthAnchor.constraint(equalToConstant: 120).isActive = true
//        progressViewBR.heightAnchor.constraint(equalToConstant: 20).isActive = true
//        //change the height
//        progressViewBR.setProgress(tempBR, animated: true)
//        progressViewBR.progressTintColor = .red
//
//
//    }
    
    override func viewDidLoad() {
           super.viewDidLoad()
         }
    
    
}
