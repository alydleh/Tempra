//
//  globalVars.swift
//  RedApp_wFrontEnd
//
//  Created by Megan :) on 12/3/18.
//  Copyright © 2018 2.009RED. All rights reserved.
//

import Foundation
import AWSIoT

class globalVars{
    static var temps = [0,0,0,0]
    static var bases = ["none","none","none","none"]
    static var foods = ["","","",""]
    static var dangerousTemp = [Int]()
    static var timers = [0,0,0,0]
    static var midTemps = [0.0,0.0,0.0,0.0]
    static var burnerNumber = 1
    static var alertArray = [0,0,0,0]
    
    init(){
        if type(of: self).alertArray.contains(1){
            Server.alert = 0
        }else{
            Server.alert = 2
        }
        linearFit()
        tempAdjust()
        
    }
    
    func linearFit(){
        var bases = ["N/A","N/A","N/A","N/A"]
        for (oil, tf) in BasesControllerTR.oilSelected{
            //            print(oil,tf)
            if tf == true {
                bases[3] = oil
                //                print("chosen oil",chosenOil)
            }
            
        }
        for (oil, tf) in BasesControllerBR.oilSelected{
            //            print(oil,tf)
            if tf == true {
                bases[2] = oil
                //                print("chosen oil",chosenOil)
            }
            
        }
        for (oil, tf) in BasesControllerTL.oilSelected{
            //            print(oil,tf)
            if tf == true {
                bases[1] = oil
                //                print("chosen oil",chosenOil)
            }
            
        }
        for (oil, tf) in BasesControllerBL.oilSelected{
            //            print(oil,tf)
            if tf == true {
                bases[0] = oil
                //                print("chosen oil",chosenOil)
            }
            
        }
        var temps = Server.temps
        var count = 0
        var index = 0
        if temps.count == type(of: self).bases.count{
            for base in bases{
                if base == "Water"{
                    temps[count] = temps[count]*1.74-22.2
                }else if base == "Olive Oil"{
                    temps[count] = 1.33*temps[count]-5.94
                }else if base == "Vegetable Oil"{
                    temps[count] = temps[count]*1.37-9.97
                }else if base == "Butter"{
                    temps[count] = temps[count]*2.35-48.1
                }else if base == "Sesame Oil" || base == "None" {
                    temps[count] = temps[count]*1.35-7.83
                }
                count+=1
            }
            if temps.count>0{
                do{
                    for temp in temps{
                    temps[index] = temp*9/5 + 32
                    index+=1
                    }

                    type(of: self).midTemps=try temperatureSetting(temps: temps)
                }catch{
                    print("we got error")
                }
            }
        }
    }
    func temperatureSetting(temps: [Double]) throws -> [Double] {
        if temps.count != 0 {
            return temps
        }
        return type(of: self).midTemps
    }
    func tempAdjust(){
        var temps = type(of: self).midTemps
        var count = 0
        var temp1 = [0,0,0,0]
        for temperature in temps{
            if temperature<100.0{
                temps[count]=round(temperature*0.2)/0.2
            }else{
                temps[count] = round(temperature/100*20)/20*100
            }
            count+=1
        }
        var i = 0
        for temperature in temps{
            temp1[i] = Int(temperature)
            i+=1
        }
        type(of: self).temps = temp1
    }
    
    //    func checkForDanger(){
    //        for base in type(of: self).bases{
    //            if base
    //        }
    //    }
    
    
}
