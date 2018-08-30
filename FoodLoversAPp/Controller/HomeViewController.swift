//
//  HomeViewController.swift
//  FoodLoversAPp
//
//  Created by Thobio Joseph on 25/08/18.
//  Copyright © 2018 Love2Code. All rights reserved.
//

import UIKit
import FirebaseAuth
class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func logoutButtonAction(_ sender: Any) {
        do{
            try Auth.auth().signOut()
        }catch let error {
            AlertViews.showBasicAlertError(on: self, with: "Error", message: error.localizedDescription)
        }
        let vc = storyboard?.instantiateViewController(withIdentifier: "signin") as! SigninViewController
        self.present(vc, animated: true, completion: nil)
    }
}
