//
//  ViewController.swift
//  FoodLoversAPp
//
//  Created by Thobio Joseph on 25/08/18.
//  Copyright © 2018 Love2Code. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SigninViewController: UIViewController {
    
    @IBOutlet var emailTextFields: UITextField!
    @IBOutlet var passwordTextFields: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if Auth.auth().currentUser != nil {
                self.performSegue(withIdentifier: "loginSeg", sender: self)
        }
    }
    @IBAction func siginInAction(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailTextFields.text!, password: passwordTextFields.text!) { (auths, error) in
            if error != nil{
                AlertViews.showBasicAlertError(on: self, with: "Error", message: (error?.localizedDescription)!)
                return
            }
            guard let currentUser = auths?.user else{return}
            self.performSegue(withIdentifier: "loginSeg", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginSeg" {
            
        }
    }
}

