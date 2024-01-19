//
//  RadialGradientView.swift
//  RedApp_wFrontEnd
//
//  Created by Aly Huerta on 12/8/18.
//  Copyright © 2018 2.009RED. All rights reserved.
//

import UIKit

class RadialGradientView: UIView {
    
    var ingredientsData = IngredientsData()
    
    var burnercolor = UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0).cgColor {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var endRadiusFactor = 0.25 {
        didSet{
            setNeedsDisplay()
        }
    }
    
    var startRadiusFactor = 0.0 {
        didSet{
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        let colors = [burnercolor, UIColor.white.cgColor] as CFArray
        print(colors)
        let center = CGPoint(x: frame.width/2, y: frame.height/2)
        let endRadius = CGFloat(endRadiusFactor)*min(frame.width, frame.height)
        let startRadius = CGFloat(startRadiusFactor)*min(frame.width, frame.height)
        
        let gradient = CGGradient(colorsSpace: nil, colors: colors, locations: nil)
        
        UIGraphicsGetCurrentContext()!.drawRadialGradient(gradient!, startCenter: center, startRadius: startRadius, endCenter: center, endRadius: endRadius, options: CGGradientDrawingOptions.drawsBeforeStartLocation)
        
    }
    
    func updateBurner(_ temp:Float, _ key:String)
    {
        if temp < 100.0 {
            self.burnercolor = UIColor.white.cgColor
            self.endRadiusFactor = Double(0.25)
            self.startRadiusFactor = Double(0.0)
        }
            
        else if temp >= Float(ingredientsData.smokePoint(key)) {
            self.burnercolor = UIColor.red.cgColor
            self.endRadiusFactor = Double(0.5)
            self.startRadiusFactor = Double(0.35)
        }
            
        else {
            
            let redVal = CGFloat(1.0)
            let greenVal = CGFloat(((-116.0/325.0)*temp+(3259.0/13.0))/255)
            let blueVal = CGFloat((temp*(71.0/325.0)-71.0/325.0)/255)
//            let alphaVal = CGFloat(temp*(0.8/325.0)-80.0/325.0)
            let alphaVal = CGFloat(1.0)
            
            self.burnercolor = UIColor(red:redVal, green:greenVal, blue:blueVal, alpha:alphaVal).cgColor
            self.endRadiusFactor = Double(temp*(0.11/325.0)+0.357)
//            self.endRadiusFactor = Double(0.5)
            self.startRadiusFactor = Double(0.2)
        }
    }
}
