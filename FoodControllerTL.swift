//
//  FoodControllerTL.swift
//  RedApp_wFrontEnd
//
//  Created by Aly Huerta on 12/5/18.
//  Copyright © 2018 2.009RED. All rights reserved.
//
import UIKit

class FoodControllerTL: UIViewController {
    
    
    //all the button icons
    
    @IBOutlet weak var chickenIcon: UIButton!
    
    @IBOutlet weak var eggIcon: UIButton!
    
    @IBOutlet weak var fishIcon: UIButton!
    
    @IBOutlet weak var porkIcon: UIButton!
    
    @IBOutlet weak var steakIcon: UIButton!
    @IBOutlet weak var otherIcon: UIButton!
    
    
    
    
    
    var iconsArray: [String:UIButton] = [:]
    static var meatSelected: [String:Bool] =
        ["Chicken":false,
         "Egg":false,
         "Fish":false,
         "Pork":false,
         "Steak":false,
         "Other":false]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.iconsArray["Egg"]=self.eggIcon
        self.iconsArray["Chicken"]=self.chickenIcon
        self.iconsArray["Fish"]=self.fishIcon
        self.iconsArray["Pork"]=self.porkIcon
        self.iconsArray["Steak"]=self.steakIcon
        self.iconsArray["Other"]=self.otherIcon
        
        selectedFoods()
    }
    
    
    func selectedFoods(){
        var selected = ""
        for (oil, tf) in type(of: self).meatSelected{
            //            print(oil,tf)
            if tf == true {
                selected = oil
            }
        }
        if selected == "Pork"{
            self.iconsArray["Pork"]!.setImage(UIImage(named:"Pork"+"_selected.png"),for:.normal)
        }else if selected == "Chicken"{
            self.iconsArray["Chicken"]!.setImage(UIImage(named:"Chicken"+"_selected.png"),for:.normal)
        }else if selected == "Egg"{
            self.iconsArray["Egg"]!.setImage(UIImage(named:"Egg"+"_selected.png"),for:.normal)
        }else if selected == "Fish"{
            self.iconsArray["Fish"]!.setImage(UIImage(named:"Fish"+"_selected.png"),for:.normal)
        }else if selected == "Steak"{
            self.iconsArray["Steak"]!.setImage(UIImage(named:"Steak"+"_selected.png"),for:.normal)
        }else if selected == "Other"{
            self.iconsArray["Other"]!.setImage(UIImage(named:"Other"+"_selected.png"),for:.normal)
        }
        
    }
    
   
        
    @IBAction func porkClicked(_ sender: Any) {
   
    let button1="Pork" //e.g. Olive
        let button2="Pork" //e.g. Olive Oil
        
        if type(of:self).meatSelected[button2]==true
        {
            type(of:self).meatSelected[button2]=false
            self.iconsArray[button1]!.setImage(UIImage(named:button1+"_unselected.png"),for:.normal)
            
            print(type(of:self).meatSelected)
        }
            
        else if type(of:self).meatSelected[button2]==false && type(of:self).meatSelected.values.contains(true)
        {
            //unselect the other one and select this one instead
            
            let b = type(of:self).meatSelected.filter {$0.value == true}
            let key = b.keys.first
            print("this is the key: "+key!)
            
            if key=="Pork"
            {
                type(of:self).meatSelected[key!]=false
                porkIcon.setImage(UIImage(named:"Pork_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Egg"
            {
                type(of:self).meatSelected[key!]=false
                eggIcon.setImage(UIImage(named:"Egg_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Chicken"
            {
                type(of:self).meatSelected[key!]=false
                chickenIcon.setImage(UIImage(named:"Chicken_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Steak"
            {
                type(of:self).meatSelected[key!]=false
                steakIcon.setImage(UIImage(named:"Steak_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Fish"
            {
                type(of:self).meatSelected[key!]=false
                fishIcon.setImage(UIImage(named:"Fish_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
                
            }
            else if key=="Other"
            {
                type(of:self).meatSelected[key!]=false
                otherIcon.setImage(UIImage(named:"Other_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
                
            }
            
            
            print(type(of:self).meatSelected)
            
        }
            
        else
        {
            type(of:self).meatSelected[button2]=true
            self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            print(type(of:self).meatSelected)
        }
    }
    
    
    
        
    @IBAction func eggClicked(_ sender: Any) {
    
    let button1="Egg" //e.g. Olive
        let button2="Egg" //e.g. Olive Oil
        
        if type(of:self).meatSelected[button2]==true
        {
            type(of:self).meatSelected[button2]=false
            self.iconsArray[button1]!.setImage(UIImage(named:button1+"_unselected.png"),for:.normal)
            
            print(type(of:self).meatSelected)
        }
            
        else if type(of:self).meatSelected[button2]==false && type(of:self).meatSelected.values.contains(true)
        {
            //unselect the other one and select this one instead
            
            let b = type(of:self).meatSelected.filter {$0.value == true}
            let key = b.keys.first
            print("this is the key: "+key!)
            
            if key=="Pork"
            {
                type(of:self).meatSelected[key!]=false
                porkIcon.setImage(UIImage(named:"Pork_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Egg"
            {
                type(of:self).meatSelected[key!]=false
                eggIcon.setImage(UIImage(named:"Egg_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Chicken"
            {
                type(of:self).meatSelected[key!]=false
                chickenIcon.setImage(UIImage(named:"Chicken_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Steak"
            {
                type(of:self).meatSelected[key!]=false
                steakIcon.setImage(UIImage(named:"Steak_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Fish"
            {
                type(of:self).meatSelected[key!]=false
                fishIcon.setImage(UIImage(named:"Fish_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
                
            }
            else if key=="Other"
            {
                type(of:self).meatSelected[key!]=false
                otherIcon.setImage(UIImage(named:"Other_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
                
            }
            
            
            print(type(of:self).meatSelected)
            
        }
            
        else
        {
            type(of:self).meatSelected[button2]=true
            self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            print(type(of:self).meatSelected)
        }
    }
    
    
    
    
        
    @IBAction func chickenClicked(_ sender: Any) {
  
    let button1="Chicken" //e.g. Olive
        let button2="Chicken" //e.g. Olive Oil
        
        if type(of:self).meatSelected[button2]==true
        {
            type(of:self).meatSelected[button2]=false
            self.iconsArray[button1]!.setImage(UIImage(named:button1+"_unselected.png"),for:.normal)
            
            print(type(of:self).meatSelected)
        }
            
        else if type(of:self).meatSelected[button2]==false && type(of:self).meatSelected.values.contains(true)
        {
            //unselect the other one and select this one instead
            
            let b = type(of:self).meatSelected.filter {$0.value == true}
            let key = b.keys.first
            print("this is the key: "+key!)
            
            if key=="Pork"
            {
                type(of:self).meatSelected[key!]=false
                porkIcon.setImage(UIImage(named:"Pork_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Egg"
            {
                type(of:self).meatSelected[key!]=false
                eggIcon.setImage(UIImage(named:"Egg_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Chicken"
            {
                type(of:self).meatSelected[key!]=false
                chickenIcon.setImage(UIImage(named:"Chicken_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Steak"
            {
                type(of:self).meatSelected[key!]=false
                steakIcon.setImage(UIImage(named:"Steak_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Fish"
            {
                type(of:self).meatSelected[key!]=false
                fishIcon.setImage(UIImage(named:"Fish_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
                
            }
            else if key=="Other"
            {
                type(of:self).meatSelected[key!]=false
                otherIcon.setImage(UIImage(named:"Other_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
                
            }
            
            
            print(type(of:self).meatSelected)
            
        }
            
        else
        {
            type(of:self).meatSelected[button2]=true
            self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            print(type(of:self).meatSelected)
        }
    }
    
    
   
        
    @IBAction func steakClicked(_ sender: Any) {
   
    let button1="Steak" //e.g. Olive
        let button2="Steak" //e.g. Olive Oil
        
        if type(of:self).meatSelected[button2]==true
        {
            type(of:self).meatSelected[button2]=false
            self.iconsArray[button1]!.setImage(UIImage(named:button1+"_unselected.png"),for:.normal)
            
            print(type(of:self).meatSelected)
        }
            
        else if type(of:self).meatSelected[button2]==false && type(of:self).meatSelected.values.contains(true)
        {
            //unselect the other one and select this one instead
            
            let b = type(of:self).meatSelected.filter {$0.value == true}
            let key = b.keys.first
            print("this is the key: "+key!)
            
            if key=="Pork"
            {
                type(of:self).meatSelected[key!]=false
                porkIcon.setImage(UIImage(named:"Pork_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Egg"
            {
                type(of:self).meatSelected[key!]=false
                eggIcon.setImage(UIImage(named:"Egg_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Chicken"
            {
                type(of:self).meatSelected[key!]=false
                chickenIcon.setImage(UIImage(named:"Chicken_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Steak"
            {
                type(of:self).meatSelected[key!]=false
                steakIcon.setImage(UIImage(named:"Steak_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Fish"
            {
                type(of:self).meatSelected[key!]=false
                fishIcon.setImage(UIImage(named:"Fish_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
                
            }
            else if key=="Other"
            {
                type(of:self).meatSelected[key!]=false
                otherIcon.setImage(UIImage(named:"Other_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
                
            }
            
            
            print(type(of:self).meatSelected)
            
        }
            
        else
        {
            type(of:self).meatSelected[button2]=true
            self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            print(type(of:self).meatSelected)
        }
    }
    
    
    
    
        
    @IBAction func fishClicked(_ sender: Any) {
   
    let button1="Fish" //e.g. Olive
        let button2="Fish" //e.g. Olive Oil
        
        if type(of:self).meatSelected[button2]==true
        {
            type(of:self).meatSelected[button2]=false
            self.iconsArray[button1]!.setImage(UIImage(named:button1+"_unselected.png"),for:.normal)
            
            print(type(of:self).meatSelected)
        }
            
        else if type(of:self).meatSelected[button2]==false && type(of:self).meatSelected.values.contains(true)
        {
            //unselect the other one and select this one instead
            
            let b = type(of:self).meatSelected.filter {$0.value == true}
            let key = b.keys.first
            print("this is the key: "+key!)
            
            if key=="Pork"
            {
                type(of:self).meatSelected[key!]=false
                porkIcon.setImage(UIImage(named:"Pork_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Egg"
            {
                type(of:self).meatSelected[key!]=false
                eggIcon.setImage(UIImage(named:"Egg_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Chicken"
            {
                type(of:self).meatSelected[key!]=false
                chickenIcon.setImage(UIImage(named:"Chicken_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Steak"
            {
                type(of:self).meatSelected[key!]=false
                steakIcon.setImage(UIImage(named:"Steak_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Fish"
            {
                type(of:self).meatSelected[key!]=false
                fishIcon.setImage(UIImage(named:"Fish_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
                
            }
            else if key=="Other"
            {
                type(of:self).meatSelected[key!]=false
                otherIcon.setImage(UIImage(named:"Other_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
                
            }
            
            
            print(type(of:self).meatSelected)
            
        }
            
        else
        {
            type(of:self).meatSelected[button2]=true
            self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            print(type(of:self).meatSelected)
        }
    }
    
    
    
    @IBAction func otherClicked(_ sender: Any) {
   
    let button1="Other" //e.g. Olive
        let button2="Other" //e.g. Olive Oil
        
        if type(of:self).meatSelected[button2]==true
        {
            type(of:self).meatSelected[button2]=false
            self.iconsArray[button1]!.setImage(UIImage(named:button1+"_unselected.png"),for:.normal)
            
            print(type(of:self).meatSelected)
        }
            
        else if type(of:self).meatSelected[button2]==false && type(of:self).meatSelected.values.contains(true)
        {
            //unselect the other one and select this one instead
            
            let b = type(of:self).meatSelected.filter {$0.value == true}
            let key = b.keys.first
            print("this is the key: "+key!)
            
            if key=="Pork"
            {
                type(of:self).meatSelected[key!]=false
                porkIcon.setImage(UIImage(named:"Pork_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Egg"
            {
                type(of:self).meatSelected[key!]=false
                eggIcon.setImage(UIImage(named:"Egg_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Chicken"
            {
                type(of:self).meatSelected[key!]=false
                chickenIcon.setImage(UIImage(named:"Chicken_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Steak"
            {
                type(of:self).meatSelected[key!]=false
                steakIcon.setImage(UIImage(named:"Steak_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Fish"
            {
                type(of:self).meatSelected[key!]=false
                fishIcon.setImage(UIImage(named:"Fish_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
                
            }
            else if key=="Other"
            {
                type(of:self).meatSelected[key!]=false
                otherIcon.setImage(UIImage(named:"Other_unselected.png"),for:.normal)
                type(of:self).meatSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
                
            }
            
            
            print(type(of:self).meatSelected)
            
        }
            
        else
        {
            type(of:self).meatSelected[button2]=true
            self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            print(type(of:self).meatSelected)
        }
    }
    
}



