//
//  CustomTextFields.swift
//  FoodLoversAPp
//
//  Created by Thobio on 30/08/18.
//  Copyright © 2018 Love2Code. All rights reserved.
//

import UIKit

class CustomTextFields: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: UIColor(white: 1.0, alpha: 0.6)])
        layer.addSublayer(textFieldsDesign(textFields: self))
    }
    func textFieldsDesign(textFields:UITextField) -> CALayer{
        
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 0, y: textFields.bounds.height - 1, width: textFields.bounds.width - 8, height: 0.6)
        bottomLayer.backgroundColor = UIColor.white.withAlphaComponent(0.4).cgColor
        return bottomLayer
        
    }
 
}
