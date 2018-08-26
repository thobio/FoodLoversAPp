//
//  ViewController.swift
//  FoodLoversAPp
//
//  Created by Thobio Joseph on 25/08/18.
//  Copyright © 2018 Love2Code. All rights reserved.
//

import UIKit

class SigninViewController: UIViewController {
    @IBOutlet var emailTextFields: UITextField!
    @IBOutlet var passwordTextFields: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        UIDisgnFunction()
    }
    func UIDisgnFunction(){
        
        self.emailTextFields.attributedPlaceholder = NSAttributedString(string: emailTextFields.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: UIColor(white: 1.0, alpha: 0.6)])
        self.emailTextFields.layer.addSublayer(textFieldsDesign(textFields: self.emailTextFields))
        
        
        self.passwordTextFields.attributedPlaceholder = NSAttributedString(string: passwordTextFields.placeholder!, attributes: [NSAttributedStringKey.foregroundColor : UIColor(white: 1.0, alpha: 0.6)])
        self.passwordTextFields.layer.addSublayer(textFieldsDesign(textFields: self.passwordTextFields))
        
    }
    
    func textFieldsDesign(textFields:UITextField) -> CALayer{
        
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 0, y: textFields.bounds.height - 1, width: textFields.bounds.width + 8, height: 0.6)
        bottomLayer.backgroundColor = UIColor.white.withAlphaComponent(0.4).cgColor
        return bottomLayer
        
    }
    
}

