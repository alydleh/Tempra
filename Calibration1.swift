//
//  LoadingScreen.swift
//  RedApp_wFrontEnd
//
//  Created by Megan :) on 12/3/18.
//  Copyright © 2018 2.009RED. All rights reserved.
//
import UIKit

class calibration1: UIViewController {
    var viewTimer: Timer? = nil //this was added
    var changedState: Bool = false //this was added
    var numberOfBurners = 1
    
    @IBOutlet weak var burnerNum: UILabel!
    @IBAction func plus(_ sender: Any) {
        numberOfBurners+=1
        burnerNum.text = "\(numberOfBurners)"
        globalVars.burnerNumber = numberOfBurners
    }
    
    @IBAction func minus(_ sender: Any) {
        if numberOfBurners>1{
            numberOfBurners-=1
            burnerNum.text = "\(numberOfBurners)"
            globalVars.burnerNumber = numberOfBurners
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = globalVars()
        // Do any additional setup after loading the view, typically from a nib.
        burnerNum.text = "\(numberOfBurners)"
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewTimer = Timer.scheduledTimer(timeInterval: 2,target: self,selector: #selector(self.doThings),userInfo: nil, repeats: true)
        // this was changed
    }
    
    @objc func doThings(){
        switchState()  // updates internal states
        stateChange()  //changes the storyboard accoringly --- carry this function over to EVERY UI view controller
        
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
    
}
