//
//  CustomButton.swift
//  AnimationsJazz
//
//  Created by Daniel J Janiak on 10/17/16.
//  Copyright © 2016 redwoodempiredev. All rights reserved.
//

import UIKit
import pop

@IBDesignable
class CustomButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable var fontColor: UIColor = UIColor.white {
        didSet {
            self.tintColor = fontColor
        }
    }
    
    override func awakeFromNib() {
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setupView()
    }
    
    func setupView() {
        
        self.layer.cornerRadius = cornerRadius
        
        self.addTarget(self, action: #selector(CustomButton.scaleToSmall), for: .touchDown)
        self.addTarget(self, action: #selector(CustomButton.scaleToSmall), for: .touchDragEnter)
        self.addTarget(self, action: #selector(CustomButton.scaleAnimation), for: .touchUpInside)
        self.addTarget(self, action: #selector(CustomButton.scaleDefault), for: .touchDragExit)
        
    }
    
    // MARK: - Animation methods
    
    func scaleToSmall() {
        
        let scaleAnimation = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnimation?.toValue = NSValue(cgSize: CGSize(width: 0.9, height: 0.9))
        
        self.layer.pop_add(scaleAnimation, forKey: "layerScaleSmallAnimation")
    }
    
    func scaleAnimation() {
        
        let scaleAnimation = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnimation?.velocity = NSValue(cgSize: CGSize(width: 2.0, height: 2.0))
        scaleAnimation?.toValue = NSValue(cgSize: CGSize(width: 1.0, height: 1.0))
        scaleAnimation?.springBounciness = 18
        self.layer.pop_add(scaleAnimation, forKey: "layerScaleSpringAnimation")
        
    }
    
    func scaleDefault() {
        
        let scaleAnimation = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnimation?.toValue = NSValue(cgSize: CGSize(width: 1, height: 1))
        self.layer.pop_add(scaleAnimation, forKey: "layerScaleDefaultAnimation")
        
    }
}
