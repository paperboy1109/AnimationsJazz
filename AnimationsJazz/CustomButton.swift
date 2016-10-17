//
//  CustomButton.swift
//  AnimationsJazz
//
//  Created by Daniel J Janiak on 10/17/16.
//  Copyright © 2016 redwoodempiredev. All rights reserved.
//

import UIKit

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
        
    }
    
}
