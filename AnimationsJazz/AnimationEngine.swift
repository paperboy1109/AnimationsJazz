//
//  AnimationEngine.swift
//  AnimationsJazz
//
//  Created by Daniel J Janiak on 11/11/16.
//  Copyright © 2016 redwoodempiredev. All rights reserved.
//

import UIKit
import pop

class AnimationEngine {
    
    class var offScreenRightPosition: CGPoint {
        
        // CGPointMake(UIScreen.main.bounds.width, UIScreen.main.bounds.midY) -- CGPointMake is not available in Swift 3
        return CGPoint(x: UIScreen.main.bounds.width, y: UIScreen.main.bounds.midY)
    }
    
    class var offScreenLeftPosition: CGPoint {
        return CGPoint(x: -UIScreen.main.bounds.width, y: UIScreen.main.bounds.midY)
    }
    
    class var screenCenterPosition: CGPoint {
        return CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
    }
    
    var originalConstants = [CGFloat]()
    var constraints: [NSLayoutConstraint]!
    let ANIM_DELAY = 0.8
    
    init(constraints: [NSLayoutConstraint]) {
        
        for item in constraints {
            
            /* Store the original constraints */
            originalConstants.append(item.constant)
            
            /* Move items out of the visible screen area */
            item.constant = AnimationEngine.offScreenRightPosition.x
        }
        
        
        self.constraints = constraints
    }
    
    func animateOnScreen(delay: Double?) {
        
        let timeDelay = delay == nil ? ANIM_DELAY * Double(NSEC_PER_SEC) : delay
        //let time = dispatch_time_t(DISPATCH_TIME_NOW, Int64(timeDelay!))
        
        let animationPause = DispatchTime.now() + timeDelay!
        
        DispatchQueue.main.asyncAfter(deadline: animationPause) {
                                                                        
            var index = 0
            
            repeat {
                
                let moveAnimation = POPSpringAnimation(propertyNamed: kPOPLayoutConstraintConstant)
                moveAnimation?.toValue = self.originalConstants[index]
                moveAnimation?.springBounciness = 18
                moveAnimation?.springSpeed = 18
                
                moveAnimation?.dynamicsFriction += 10
                moveAnimation?.dynamicsMass = 10
                
                let layoutConstraint = self.constraints[index]
                layoutConstraint.pop_add(moveAnimation, forKey: "moveOnScreen")
                
                index += 1
                
            } while (index < self.constraints.count)
            
        }
    }
}
