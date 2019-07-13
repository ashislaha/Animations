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
        
        // 1. Add Color Layer
        let colorLayer = CALayer()
        colorLayer.backgroundColor = UIColor(white: 0.9, alpha: 1).cgColor
        colorLayer.frame = bounds
        colorLayer.name = "colorLayer"
        layer.addSublayer(colorLayer)
        autoresizesSubviews = true
        clipsToBounds = true
        
        // 2. Add loader Layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(white: 0.9, alpha: 1).cgColor,
                                UIColor(white: 0.97, alpha: 1).cgColor,
                                UIColor(white: 0.9, alpha: 1).cgColor]
        gradientLayer.locations = [0,0.4,0.8, 1]
        gradientLayer.name = "loaderLayer"
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
        
        // 3. Animate loader layer
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 3.0
        animation.fromValue = -frame.width
        animation.toValue = frame.width
        animation.repeatCount = Float.infinity
        gradientLayer.add(animation, forKey: "smartLoader")
    }
}

