//
//  SignUpViewController.swift
//  FoodLoversAPp
//
//  Created by Thobio Joseph on 25/08/18.
//  Copyright © 2018 Love2Code. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class SignUpViewController: UIViewController {
    
    @IBOutlet var userNameText: CustomTextFields!
    @IBOutlet var emailText: CustomTextFields!
    @IBOutlet var passwordText: CustomTextFields!
    @IBOutlet var imageProfile: RoundImageView!
    
    var docRef:DocumentReference!
    var selectedImages:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapImage:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleSingleTap(sender:)))
        imageProfile.addGestureRecognizer(tapImage)
        imageProfile.isUserInteractionEnabled = true
        imageProfile.clipsToBounds = true
    }
    @objc func handleSingleTap(sender:UITapGestureRecognizer){
        let pickController = UIImagePickerController()
        pickController.delegate = self
        present(pickController, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func signinClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        var imageURl:String?
        if(emailText.text?.isEmpty)!{
            AlertViews.showBasicAlertError(on: self, with: "Error", message: "Username is Empty")
            return
        }
        Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (authResult, error) in
            if error != nil{
                AlertViews.showBasicAlertError(on: self, with: "Error", message: (error?.localizedDescription)!)
            }
            guard let user = authResult?.user else { return }
            let storageRef =  Storage.storage().reference().child("profile_image").child(user.uid)
            if let profilePic = self.selectedImages, let imageData = UIImageJPEGRepresentation(profilePic, 0.1){
                storageRef.putData(imageData, metadata: nil, completion: { (metadata, error) in
                    if error != nil {
                        AlertViews.showBasicAlertError(on: self, with: "Error", message: (error?.localizedDescription)!)
                        return
                    }
                    storageRef.downloadURL(completion: { (url, error) in
                        if error != nil {
                            AlertViews.showBasicAlertError(on: self, with: "Error", message: (error?.localizedDescription)!)
                            return
                        }
                        guard url != nil else {
                            return
                        }
                        imageURl = url?.absoluteString
                        self.docRef = Firestore.firestore().document("Users/"+user.uid)
                        self.docRef.setData(["username":self.userNameText.text!,"email":self.emailText.text!,"profileImage":imageURl!], completion: { (error) in
                            if let error = error {
                                AlertViews.showBasicAlertError(on: self, with: "Error", message: error.localizedDescription)
                                return
                            }
                            self.performSegue(withIdentifier: "siginPage", sender: self)
                            UserDefaults.standard.set(user.uid, forKey: "UID")
                        })
                    })
                })
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "siginPage"{
            
        }
    }
}

extension SignUpViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let images = info["UIImagePickerControllerOriginalImage"] as? UIImage
        imageProfile.image = images
        self.selectedImages = images
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}
