//
//  LoginVC.swift
//  AnimationsJazz
//
//  Created by Daniel J Janiak on 10/16/16.
//  Copyright © 2016 redwoodempiredev. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    // MARK: - Properties
    
    var animationEngine: AnimationEngine!
    
    // MARK: - Outlets
    
    @IBOutlet var stackViewXConstraint: NSLayoutConstraint!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.animationEngine = AnimationEngine(constraints: [stackViewXConstraint])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.animationEngine.animateOnScreen()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
