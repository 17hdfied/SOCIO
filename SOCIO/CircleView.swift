//
//  CircleView.swift
//  SOCIO
//
//  Created by Hardik Wason on 09/10/17.
//  Copyright © 2017 Hardik Wason. All rights reserved.
//

import UIKit

class CircleView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(red: color_gray, green: color_gray, blue: color_gray, alpha: 0.6).cgColor
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.8

    }
    override func layoutSubviews() {
        super.layoutSubviews()
         layer.cornerRadius = self.frame.width / 2
    }
}
