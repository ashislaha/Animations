//
//  ViewController.swift
//  ShimmerView
//
//  Created by Ashis Laha on 10/10/18.
//  Copyright © 2018 Ashis Laha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var smallView: ShimmerView!
    @IBOutlet weak var bigView: ShimmerView!
}

class ShimmerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        
        // add gradient layer to view layer hierarchy
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        let gradientColor = UIColor(red: 225.0/255.0, green: 225.0/255.0, blue: 225.0/255.0, alpha: 1.0)
        
        // gradient layer color and their locations
        gradientLayer.colors = [gradientColor.cgColor, gradientColor.withAlphaComponent(0.1).cgColor, gradientColor.cgColor]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        
        // direction of gradient layer (left to right)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        // add animation to gradient layer
        let basicAnimation = CABasicAnimation(keyPath: "locations")
        basicAnimation.fromValue = [0.0, 0.25, 0.5]
        basicAnimation.toValue = [0.5, 0.75, 1.0]
        basicAnimation.duration = 1.5
        basicAnimation.repeatCount = Float.infinity
        gradientLayer.add(basicAnimation, forKey: "shimmer animation")
        
        layer.mask = gradientLayer
        
        backgroundColor = gradientColor
        clipsToBounds = true
    }
}

