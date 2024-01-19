//
//  LoadingScreen.swift
//  RedApp_wFrontEnd
//
//  Created by Megan :) on 12/3/18.
//  Copyright © 2018 2.009RED. All rights reserved.
//
import UIKit
import AWSIoT
let reuseIdentifier = "pixel";
//add heat map here
// adjust internal calibration state
class calibration3: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var viewTimer: Timer? = nil //this was added
    var changedState: Bool = false //this was added
    var column = 0
    var index = 0
    var start = true
    var temps = Server.heatMap
    var indexPaths = [IndexPath]()
    var append = true
    
    @IBAction func next(_ sender: Any) {
        viewTimer!.invalidate()
        viewTimer = nil
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "calibration4")
        self.present(newViewController, animated: true, completion: nil)
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
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Server.calibrate = 2
        publish()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewTimer = Timer.scheduledTimer(timeInterval: 0.5,target: self,selector: #selector(self.doThings),userInfo: nil, repeats: true)
        // this was changed
    }
    
    @objc func doThings(){
        switchState()  // updates internal states
        stateChange()  //changes the storyboard accoringly --- carry this function over to EVERY UI view controller
        self.temps = Server.heatMap
        start = true
        collectionView.reloadItems(at: indexPaths)
        
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
    //UICollectionViewDelegateFlowLayout methods
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat
    {
        
        return 0;
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat
    {
        
        return 0;
    }
    
    
    //UICollectionViewDatasource methods
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1024
        
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as UICollectionViewCell
        if indexPath.row == 0 && !start{
            column+=1
        }
        index = column*32+indexPath.row
        start = false
        if append{
            indexPaths.append(indexPath)
            //   print(temps.count)
        }
        if append && index == 1023{
            append = false
        }
        if temps.count > index {
            cell.backgroundColor = setColor(temp: temps[index])
        }
        else {
            cell.backgroundColor = UIColor.blue
        }
        
        
        
        return cell
    }
    
    // custom function to generate a random UIColor
    func setColor(temp: Double) -> UIColor{
        var maxTemp = Server.heatMap.max()!
        if temp/maxTemp < 0.5 {
            return UIColor.blue
        }
        else if temp/maxTemp < 0.6 {
            return UIColor.cyan
        }
        else if temp/maxTemp < 0.7 {
            return UIColor.green
        }
        else if temp/maxTemp < 0.8 {
            return UIColor.yellow
        }
        else if temp/maxTemp < 0.9 {
            return UIColor.orange
        }
        else{
            return UIColor.red
        }
    }
    
    
}



