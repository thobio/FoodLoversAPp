//
//  AlertViews.swift
//  FoodLoversAPp
//
//  Created by Thobio on 30/08/18.
//  Copyright © 2018 Love2Code. All rights reserved.
//

import Foundation
import UIKit

struct AlertViews {
    static func showBasicAlertError(on vc:UIViewController, with title:String,message:String){
        let alerts = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alerts.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            vc.present(alerts, animated: true, completion: nil)
        }
    }
}
