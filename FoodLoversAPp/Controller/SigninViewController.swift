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

class SigninViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var emailTextFields: UITextField!
    @IBOutlet var passwordTextFields: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTextFields.delegate = self
        self.passwordTextFields.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if Auth.auth().currentUser != nil {
            let tabBarUI = self.storyboard?.instantiateViewController(withIdentifier: "tabBar") as! UITabBarController
            self.present(tabBarUI, animated: true, completion: nil)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func siginInAction(_ sender: UIButton) {
        ProgressHUD.show("Waiting....", interaction: false)
        Auth.auth().signIn(withEmail: emailTextFields.text!, password: passwordTextFields.text!) { (auths, error) in
            if error != nil{
                ProgressHUD.showError(error?.localizedDescription)
                //AlertViews.showBasicAlertError(on: self, with: "Error", message: (error?.localizedDescription)!)
                return
            }
            guard let currentUser = auths?.user else{return}
            ProgressHUD.showSuccess("Success")
            let tabBarUI = self.storyboard?.instantiateViewController(withIdentifier: "tabBar") as! UITabBarController
            self.present(tabBarUI, animated: true, completion: nil)
        }
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "loginSeg" {
//
//        }
//    }
}

