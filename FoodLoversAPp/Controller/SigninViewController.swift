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
        
    }
    func UIDisgnFunction(){
        self.emailTextFields.backgroundColor = UIColor.clear
        self.emailTextFields.attributedPlaceholder = NSAttributedString(string: emailTextFields.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: UIColor(white: 1.0, alpha: 0.6)])
        
        self.passwordTextFields.backgroundColor = UIColor.clear 
        self.passwordTextFields.attributedPlaceholder = NSAttributedString(string: passwordTextFields.placeholder!, attributes: [NSAttributedStringKey.foregroundColor : UIColor(white: 1.0, alpha: 0.6)])
    }
}

