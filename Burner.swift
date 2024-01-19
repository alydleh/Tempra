////
////  Burner.swift
////  RedApp_wFrontEnd
////
////  Created by Stephanie Chou and Khanh Nguyen on 12/2/18.
////  Copyright © 2018 2.009RED. All rights reserved.
////
//import UIKit
//import Foundation
//
//
//class Burner {
//    //initWithFrame to init view from code
////    var view_u=UIView()
////
////    init (_ view: UIView!) {
////
////
////        self.view_u = view
////
////    }
////
////    required init?(coder aDecoder: NSCoder) {
////        fatalError("init(coder:) has not been implemented")
////    }
//
//    //This Code controls the size of the line
//    private struct Constants {
//    static let lineWidth: CGFloat = 5.0
//    static let arcWidth: CGFloat = 76
//
//    }
//
//
//    let temp = 0; // what the temperature needs to be updated.
//    let smokePoint = 175; // This is for olive oil
//    var transparency = Double(1); //Initially off
//
//    var insideColor: UIColor = UIColor(red:0, green:0, blue:0, alpha: 0.1)
//    var outsideColor: UIColor = UIColor(red:(247/255), green:(143/255), blue:(143/255), alpha: 1)
//
//     override func draw(_ rect: CGRect) {
//
//        let rect1 = CGRect(
//        x: bounds.minX + ((bounds.width - 120) * 0.5 + 0.5).rounded(.down),
//        y: bounds.minY + ((bounds.height - 120) * 0.5 + 0.5).rounded(.down),
//        //x: 0.2,
//        //y: 0.15,
//        width: 120,
//        height: 120
//
//        )
//
//        let path1 = UIBezierPath(ovalIn: rect1)
//        insideColor.setFill()
//        path1.fill()
//
//        outsideColor.setStroke()
//        path1.lineWidth = 5
//        path1.stroke()
//    }
//
//    //How to get smoke Point
//    func colorRange(temp: Double, smokePoint: Double) {
//        if temp >= smokePoint {
//            transparency = 1 //fully visible
//            //outsideColor = UIColor(red:(247/255), green:(143/255), blue:(143/255), alpha: CGFloat(transparency))
//            //outsideColor.setStroke()
//            //self.view_u.alpha(transparency)
//        }
//        else {
//            transparency = Double(temp/smokePoint)
//            //outsideColor = UIColor(red:(247/255), green:(143/255), blue:(143/255), alpha: 0)
//            //outsideColor.setStroke()
//            //view_u.alpha(transparency)
//
//        }
//
//
//
//
//    }
//
//
//}
//
//
//
////in playground we should have a red rectangle
