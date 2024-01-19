//
//  BasesControllerTR.swift
//  RedApp_wFrontEnd
//
//  Created by Aly Huerta on 12/5/18.
//  Copyright © 2018 2.009RED. All rights reserved.
//

import UIKit

class BasesControllerTR: UIViewController {
    
    
    //all the button icons
    @IBOutlet weak var oliveIcon: UIButton!
    @IBOutlet weak var sesameIcon: UIButton!
    @IBOutlet weak var butterIcon: UIButton!
    @IBOutlet weak var waterIcon: UIButton!
    @IBOutlet weak var noneIcon: UIButton!
    @IBOutlet weak var vegetableIcon: UIButton!
    
    
    
    
    var iconsArray: [String:UIButton] = [:]
    
    static var oilSelected: [String:Bool] =
        ["Olive Oil":false,
         "Vegetable Oil":false,
         "Sesame Oil":false,
         "Butter":false,
         "Water":false,
         "None":false]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.iconsArray["Olive"]=self.oliveIcon
        self.iconsArray["Water"]=self.waterIcon
        self.iconsArray["Vegetable"]=self.vegetableIcon
        self.iconsArray["Sesame"]=self.sesameIcon
        self.iconsArray["Butter"]=self.butterIcon
        self.iconsArray["None"]=self.noneIcon
        selectedOils()
        
        
    }
    
    
    func selectedOils(){
        var selected = ""
        for (oil, tf) in type(of: self).oilSelected{
            //            print(oil,tf)
            if tf == true {
                selected = oil
            }
        }
        if selected == "Water"{
            self.iconsArray["Water"]!.setImage(UIImage(named:"Water"+"_selected.png"),for:.normal)
        }else if selected == "Vegetable Oil"{
            self.iconsArray["Vegetable"]!.setImage(UIImage(named:"Vegetable"+"_selected.png"),for:.normal)
        }else if selected == "Olive Oil"{
            self.iconsArray["Olive"]!.setImage(UIImage(named:"Olive"+"_selected.png"),for:.normal)
        }else if selected == "Sesame Oil"{
            self.iconsArray["Sesame"]!.setImage(UIImage(named:"Sesame"+"_selected.png"),for:.normal)
        }else if selected == "Butter"{
            self.iconsArray["Butter"]!.setImage(UIImage(named:"Butter"+"_selected.png"),for:.normal)
        }else if selected == "None"{
            self.iconsArray["None"]!.setImage(UIImage(named:"None"+"_selected.png"),for:.normal)
        }
        
    }
    
        
    @IBAction func waterClicked(_ sender: Any) {
   
    let button1="Water" //e.g. Olive
        let button2="Water" //e.g. Olive Oil
        
        if type(of:self).oilSelected[button2]==true
        {
            type(of:self).oilSelected[button2]=false
            self.iconsArray[button1]!.setImage(UIImage(named:button1+"_unselected.png"),for:.normal)
            
            print(type(of:self).oilSelected)
        }
            
        else if type(of:self).oilSelected[button2]==false && type(of:self).oilSelected.values.contains(true)
        {
            //unselect the other one and select this one instead
            
            let b = type(of:self).oilSelected.filter {$0.value == true}
            let key = b.keys.first
            print("this is the key: "+key!)
            
            if key=="Water"
            {
                type(of:self).oilSelected[key!]=false
                waterIcon.setImage(UIImage(named:"Water_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Olive Oil"
            {
                type(of:self).oilSelected[key!]=false
                oliveIcon.setImage(UIImage(named:"Olive_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Vegetable Oil"
            {
                type(of:self).oilSelected[key!]=false
                vegetableIcon.setImage(UIImage(named:"Vegetable_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Sesame Oil"
            {
                type(of:self).oilSelected[key!]=false
                sesameIcon.setImage(UIImage(named:"Sesame_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Butter"
            {
                type(of:self).oilSelected[key!]=false
                butterIcon.setImage(UIImage(named:"Butter_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
                
            }
            else if key=="None"
            {
                type(of:self).oilSelected[key!]=false
                noneIcon.setImage(UIImage(named:"None_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
                
            }
            
            
            print(type(of:self).oilSelected)
            
        }
            
        else
        {
            type(of:self).oilSelected[button2]=true
            self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            print(type(of:self).oilSelected)
        }
    }
    
    
   
        
    @IBAction func oliveClicked(_ sender: Any) {
  
    let button1="Olive" //e.g. Olive
        let button2="Olive Oil" //e.g. Olive Oil
        
        if type(of:self).oilSelected[button2]==true
        {
            type(of:self).oilSelected[button2]=false
            self.iconsArray[button1]!.setImage(UIImage(named:button1+"_unselected.png"),for:.normal)
            
            print(type(of:self).oilSelected)
        }
            
        else if type(of:self).oilSelected[button2]==false && type(of:self).oilSelected.values.contains(true)
        {
            //unselect the other one and select this one instead
            
            let b = type(of:self).oilSelected.filter {$0.value == true}
            let key = b.keys.first
            print("this is the key: "+key!)
            
            if key=="Water"
            {
                type(of:self).oilSelected[key!]=false
                waterIcon.setImage(UIImage(named:"Water_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Olive Oil"
            {
                type(of:self).oilSelected[key!]=false
                oliveIcon.setImage(UIImage(named:"Olive_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Vegetable Oil"
            {
                type(of:self).oilSelected[key!]=false
                vegetableIcon.setImage(UIImage(named:"Vegetable_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Sesame Oil"
            {
                type(of:self).oilSelected[key!]=false
                sesameIcon.setImage(UIImage(named:"Sesame_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Butter"
            {
                type(of:self).oilSelected[key!]=false
                butterIcon.setImage(UIImage(named:"Butter_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
                
            }
            else if key=="None"
            {
                type(of:self).oilSelected[key!]=false
                noneIcon.setImage(UIImage(named:"None_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
                
            }
            
            
            print(type(of:self).oilSelected)
            
        }
            
        else
        {
            type(of:self).oilSelected[button2]=true
            self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            print(type(of:self).oilSelected)
        }
    }
    
    
    
        
    @IBAction func sesameClicked(_ sender: Any) {
  
    let button1="Sesame" //e.g. Olive
        let button2="Sesame Oil" //e.g. Olive Oil
        
        if type(of:self).oilSelected[button2]==true
        {
            type(of:self).oilSelected[button2]=false
            self.iconsArray[button1]!.setImage(UIImage(named:button1+"_unselected.png"),for:.normal)
            
            print(type(of:self).oilSelected)
        }
            
        else if type(of:self).oilSelected[button2]==false && type(of:self).oilSelected.values.contains(true)
        {
            //unselect the other one and select this one instead
            
            let b = type(of:self).oilSelected.filter {$0.value == true}
            let key = b.keys.first
            print("this is the key: "+key!)
            
            if key=="Water"
            {
                type(of:self).oilSelected[key!]=false
                waterIcon.setImage(UIImage(named:"Water_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Olive Oil"
            {
                type(of:self).oilSelected[key!]=false
                oliveIcon.setImage(UIImage(named:"Olive_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Vegetable Oil"
            {
                type(of:self).oilSelected[key!]=false
                vegetableIcon.setImage(UIImage(named:"Vegetable_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Sesame Oil"
            {
                type(of:self).oilSelected[key!]=false
                sesameIcon.setImage(UIImage(named:"Sesame_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Butter"
            {
                type(of:self).oilSelected[key!]=false
                butterIcon.setImage(UIImage(named:"Butter_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
                
            }
            else if key=="None"
            {
                type(of:self).oilSelected[key!]=false
                noneIcon.setImage(UIImage(named:"None_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
                
            }
            
            
            print(type(of:self).oilSelected)
            
        }
            
        else
        {
            type(of:self).oilSelected[button2]=true
            self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            print(type(of:self).oilSelected)
        }
        
        
    }
    
    
   
    @IBAction func butterClicked(_ sender: Any) {
   
    let button1="Butter" //e.g. Olive
        let button2="Butter" //e.g. Olive Oil
        
        if type(of:self).oilSelected[button2]==true
        {
            type(of:self).oilSelected[button2]=false
            self.iconsArray[button1]!.setImage(UIImage(named:button1+"_unselected.png"),for:.normal)
            
            print(type(of:self).oilSelected)
        }
            
        else if type(of:self).oilSelected[button2]==false && type(of:self).oilSelected.values.contains(true)
        {
            //unselect the other one and select this one instead
            
            let b = type(of:self).oilSelected.filter {$0.value == true}
            let key = b.keys.first
            print("this is the key: "+key!)
            
            if key=="Water"
            {
                type(of:self).oilSelected[key!]=false
                waterIcon.setImage(UIImage(named:"Water_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Olive Oil"
            {
                type(of:self).oilSelected[key!]=false
                oliveIcon.setImage(UIImage(named:"Olive_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Vegetable Oil"
            {
                type(of:self).oilSelected[key!]=false
                vegetableIcon.setImage(UIImage(named:"Vegetable_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Sesame Oil"
            {
                type(of:self).oilSelected[key!]=false
                sesameIcon.setImage(UIImage(named:"Sesame_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Butter"
            {
                type(of:self).oilSelected[key!]=false
                butterIcon.setImage(UIImage(named:"Butter_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
                
            }
            else if key=="None"
            {
                type(of:self).oilSelected[key!]=false
                noneIcon.setImage(UIImage(named:"None_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
                
            }
            
            
            print(type(of:self).oilSelected)
            
        }
            
        else
        {
            type(of:self).oilSelected[button2]=true
            self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            print(type(of:self).oilSelected)
        }
        
        
    }
    
    
    
        
    @IBAction func vegetableClicked(_ sender: Any) {
   
    let button1="Vegetable" //e.g. Olive
        let button2="Vegetable Oil" //e.g. Olive Oil
        
        if type(of:self).oilSelected[button2]==true
        {
            type(of:self).oilSelected[button2]=false
            self.iconsArray[button1]!.setImage(UIImage(named:button1+"_unselected.png"),for:.normal)
            
            print(type(of:self).oilSelected)
        }
            
        else if type(of:self).oilSelected[button2]==false && type(of:self).oilSelected.values.contains(true)
        {
            //unselect the other one and select this one instead
            
            let b = type(of:self).oilSelected.filter {$0.value == true}
            let key = b.keys.first
            print("this is the key: "+key!)
            
            if key=="Water"
            {
                type(of:self).oilSelected[key!]=false
                waterIcon.setImage(UIImage(named:"Water_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Olive Oil"
            {
                type(of:self).oilSelected[key!]=false
                oliveIcon.setImage(UIImage(named:"Olive_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Vegetable Oil"
            {
                type(of:self).oilSelected[key!]=false
                vegetableIcon.setImage(UIImage(named:"Vegetable_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Sesame Oil"
            {
                type(of:self).oilSelected[key!]=false
                sesameIcon.setImage(UIImage(named:"Sesame_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Butter"
            {
                type(of:self).oilSelected[key!]=false
                butterIcon.setImage(UIImage(named:"Butter_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
                
            }
            else if key=="None"
            {
                type(of:self).oilSelected[key!]=false
                noneIcon.setImage(UIImage(named:"None_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
                
            }
            
            
            print(type(of:self).oilSelected)
            
        }
            
        else
        {
            type(of:self).oilSelected[button2]=true
            self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            print(type(of:self).oilSelected)
        }
        
        
    }
    
    
    
   
        
    @IBAction func noneClicked(_ sender: Any) {
  
    let button1="None" //e.g. Olive
        let button2="None" //e.g. Olive Oil
        
        if type(of:self).oilSelected[button2]==true
        {
            type(of:self).oilSelected[button2]=false
            self.iconsArray[button1]!.setImage(UIImage(named:button1+"_unselected.png"),for:.normal)
            
            print(type(of:self).oilSelected)
        }
            
        else if type(of:self).oilSelected[button2]==false && type(of:self).oilSelected.values.contains(true)
        {
            //unselect the other one and select this one instead
            
            let b = type(of:self).oilSelected.filter {$0.value == true}
            let key = b.keys.first
            print("this is the key: "+key!)
            
            if key=="Water"
            {
                type(of:self).oilSelected[key!]=false
                waterIcon.setImage(UIImage(named:"Water_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Olive Oil"
            {
                type(of:self).oilSelected[key!]=false
                oliveIcon.setImage(UIImage(named:"Olive_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Vegetable Oil"
            {
                type(of:self).oilSelected[key!]=false
                vegetableIcon.setImage(UIImage(named:"Vegetable_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Sesame Oil"
            {
                type(of:self).oilSelected[key!]=false
                sesameIcon.setImage(UIImage(named:"Sesame_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            }
                
            else if key=="Butter"
            {
                type(of:self).oilSelected[key!]=false
                butterIcon.setImage(UIImage(named:"Butter_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
                
            }
            else if key=="None"
            {
                type(of:self).oilSelected[key!]=false
                noneIcon.setImage(UIImage(named:"None_unselected.png"),for:.normal)
                type(of:self).oilSelected[button2]=true
                self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
                
            }
            
            
            print(type(of:self).oilSelected)
            
        }
            
        else
        {
            type(of:self).oilSelected[button2]=true
            self.iconsArray[button1]!.setImage(UIImage(named:button1+"_selected.png"),for:.normal)
            print(type(of:self).oilSelected)
        }
        
        
    }
}
