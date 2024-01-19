//
//  VerticalProgressBar.swift
//  RedApp_wFrontEnd
//
//  Created by Stephanie Chou on 11/28/18.
//  Copyright © 2018 2.009RED. All rights reserved.
//

import Foundation

import UIKit

class VerticalProgressView: UIView {
    
    private let progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progress = 0.0 // this will be the current temperature! Default is 0 (not reading)
        progressView.translatesAutoresizingMaskIntoConstraints = false //can now use constraints programmatically and lay it properly in ViewController
        return progressView
    }()
    
    var progress:Float {
        get {
            return progressView.progress
        }
        
        set {
            progressView.progress = newValue //here we update the value of progress
        }
    }
    
    var progressViewStyle: UIProgressView.Style {
        get {
            return progressView.progressViewStyle
        }
        
        set {
            progressView.progressViewStyle = newValue
        }
    }
    
    var progressTintColor: UIColor? {
        //the tint of the changing bar
        get {
            return progressView.progressTintColor
        }
        
        set {
            progressView.progressTintColor = newValue
        }
    }
    
    var progressImage: UIImage? {
        //the image of the changing bar
        get {
            return progressView.progressImage
        }
        
        set {
            progressView.progressImage = newValue
        }
    }
    
    var trackTintColor: UIColor? {
        //the tint of the backgroun bar
        get {
            return progressView.trackTintColor
        }
        
        set {
            progressView.trackTintColor = newValue
        }
    }
    
    var trackImage: UIImage? {
        //the image of the background bar
        get {
            return progressView.trackImage
        }
        
        set {
            progressView.trackImage = newValue
        }
    }
    
    func setProgress(_ progress: Float, animated: Bool) {
        progressView.setProgress(progress, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(progressView)
        
        let width = bounds.width
        let height = bounds.height
        
        progressView.bounds.size.width = width
        progressView.bounds.size.height = height
        progressView.center.x = bounds.midX
        progressView.center.y = bounds.midY
        progressView.layer.cornerRadius = 2.5
        progressView.clipsToBounds = true
        
        rotateProgressView()
        
    }
    
    private func rotateProgressView() {
        progressView.transform = CGAffineTransform(rotationAngle: .pi * -0.5) // rotate 90 degrees counterclockwise. Progress of 0 at bottom, 1 at top
    }
    
    override var intrinsicContentSize: CGSize{
        get {
            return CGSize(width: progressView.intrinsicContentSize.width, height: progressView.intrinsicContentSize.height) //The instructions flipped height and width, but that is because in the View Controller, they set width to be < height. I left width > height, so am keeping width greater than height, and rotating 90 degrees.
            
        }
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
