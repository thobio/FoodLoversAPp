//
//  RoundImageView.swift
//  FoodLoversAPp
//
//  Created by Thobio on 30/08/18.
//  Copyright © 2018 Love2Code. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView {

    override func awakeFromNib() {
        layer.cornerRadius = layer.bounds.width/2
    }

}
