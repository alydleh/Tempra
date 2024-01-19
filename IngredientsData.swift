//
//  IngredientsData.swift
//  RedApp_wFrontEnd
//
//  Created by Aly Huerta on 12/9/18.
//  Copyright © 2018 2.009RED. All rights reserved.
//

import Foundation

class IngredientsData{
    
    var smokepoint:Int
    var lowtemp:Int
    var hightemp:Int
    var baseselected:String
    var foodselected:String
    var isbaseselected:Bool
    var isfoodselected:Bool
    
    
    init () {
        smokepoint=10000
        lowtemp=10000
        hightemp=10000
        baseselected="None"
        foodselected="Other"
        isfoodselected=false
        isbaseselected=false
    }
    
    func smokePoint(_ base:String) -> Int {
        
        //given a base it should return the smoke point as an integer
        if base == "Olive Oil"
        {
            self.smokepoint=400
        }
        else if base == "Vegetable Oil"
        {
            self.smokepoint=400
        }
        else if base == "Sesame Oil"
        {
            self.smokepoint=350
        }
            
        else if base == "Butter"
        {
            self.smokepoint=350
        }
        else if base == "Water"
        {
            self.smokepoint=212
        }
        else if base == "None"
        {
            self.smokepoint=10000
        }
        
        return smokepoint //return as an integer
        
    }
    
    func lowTemp(_ food:String) -> Int{
        
        //given a base it should return the lower temp of the good range as an integer
        if food == "Chicken"
        {
            self.lowtemp=325
        }
        else if food == "Pork"
        {
            self.lowtemp=325
        }
        else if food == "Steak"
        {
            self.lowtemp=320
        }
            
        else if food == "Egg"
        {
            self.lowtemp=250
        }
        else if food == "Fish"
        {
            self.lowtemp=325
        }
        else if food == "Other"
        {
            self.lowtemp=10000
        }
        
        return lowtemp //return as an integer
    
    }
    
    func highTemp(_ food:String) -> Int{
        
        //given a base it should return the lower temp of the good range as an integer
        if food == "Chicken"
        {
            self.hightemp=350
        }
        else if food == "Pork"
        {
            self.hightemp=375
        }
        else if food == "Steak"
        {
            self.hightemp=370
        }
            
        else if food == "Egg"
        {
            self.hightemp=275
        }
        else if food == "Fish"
        {
            self.hightemp=375
        }
        else if food == "Other"
        {
            self.hightemp=100000
        }
        
        return hightemp
    
    }
    
    func findBaseSelected(_ burner: Int)-> String{
        if burner==0
        {
            let b = BasesControllerBL.oilSelected.filter {$0.value == true}
            baseselected = b.keys.first!
            
        }
        if burner==1
        {
            let b = BasesControllerTL.oilSelected.filter {$0.value == true}
            baseselected = b.keys.first!
            
        }
        if burner==2
        {
            let b = BasesControllerBR.oilSelected.filter {$0.value == true}
            baseselected = b.keys.first!
            
        }
        if burner==3
        {
            let b = BasesControllerTR.oilSelected.filter {$0.value == true}
            baseselected = b.keys.first!
            
        }
        
        return baseselected
    }
    
    func findFoodSelected(_ burner: Int)-> String{
        if burner==0
        {
            let f = FoodControllerBL.meatSelected.filter {$0.value == true}
            foodselected = f.keys.first!
            
        }
        if burner==1
        {
            let f = FoodControllerTL.meatSelected.filter {$0.value == true}
            foodselected = f.keys.first!
            
        }
        if burner==2
        {
            let f = FoodControllerBR.meatSelected.filter {$0.value == true}
            foodselected = f.keys.first!
            
        }
        if burner==3
        {
            let f = FoodControllerTR.meatSelected.filter {$0.value == true}
            foodselected = f.keys.first!
            
        }
        
        return foodselected
        
    }
    
    func isBaseSelected(_ burner: Int)-> Bool{
        
        if burner == 0
        {
            if BasesControllerBL.oilSelected.values.contains(true)
            {
                isbaseselected=true
            }
            else
            {
                isbaseselected=false
            }
        }
        
        if burner == 1
        {
            if BasesControllerTL.oilSelected.values.contains(true)
            {
                isbaseselected=true
            }
            else
            {
                isbaseselected=false
            }
        }
        
        if burner == 2
        {
            if BasesControllerBR.oilSelected.values.contains(true)
            {
                isbaseselected=true
            }
            else
            {
                isbaseselected=false
            }
        }
        if burner == 3
        {
            if BasesControllerTR.oilSelected.values.contains(true)
            {
                isbaseselected=true
            }
            else
            {
                isbaseselected=false
            }
        }
        
        return isbaseselected
        
    }
    func isFoodSelected(_ burner: Int)-> Bool{
        if burner == 0
        {
            if FoodControllerBL.meatSelected.values.contains(true)
            {
                isfoodselected=true
            }
            else
            {
                isfoodselected=false
            }
        }
        
        if burner == 1
        {
            if FoodControllerTL.meatSelected.values.contains(true)
            {
                isfoodselected=true
            }
            else
            {
                isfoodselected=false
            }
        }
        
        if burner == 2
        {
            if FoodControllerBR.meatSelected.values.contains(true)
            {
                isfoodselected=true
            }
            else
            {
                isfoodselected=false
            }
        }
        if burner == 3
        {
            if FoodControllerTR.meatSelected.values.contains(true)
            {
                isfoodselected=true
            }
            else
            {
                isfoodselected=false
            }
        }
        
        
        return isfoodselected
        
    }
    
    
    
}
