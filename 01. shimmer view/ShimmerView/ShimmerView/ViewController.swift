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
        let gradientSize = Float(150.0 / frame.size.width)
        let gradientColor = UIColor(red: 225.0/255.0, green: 225.0/255.0, blue: 225.0/255.0, alpha: 1.0)
        let startLocations: [NSNumber] = [0.0, NSNumber(value: gradientSize/2.0), NSNumber(value: gradientSize)]
        let endLocations: [NSNumber] = [NSNumber(value: (1.0 - gradientSize)), NSNumber(value: 1.0 - gradientSize / 2), 1.0]
        
        gradientLayer.colors = [gradientColor.cgColor, gradientColor.withAlphaComponent(0.1).cgColor, gradientColor.cgColor]
        gradientLayer.locations = startLocations
        gradientLayer.startPoint = CGPoint(x: (0 - CGFloat(gradientSize * 2.0)), y: 0.5)
        gradientLayer.endPoint = CGPoint(x: CGFloat(1.0 + gradientSize), y: 0.7)
        
        // add animation to gradient layer
        let basicAnimation = CABasicAnimation(keyPath: "locations")
        basicAnimation.fromValue = startLocations
        basicAnimation.toValue = endLocations
        basicAnimation.duration = 1.5
        basicAnimation.repeatCount = Float.infinity
        gradientLayer.add(basicAnimation, forKey: "shimmer animation")
        
        layer.mask = gradientLayer
        
        backgroundColor = gradientColor
        clipsToBounds = true
    }
}

