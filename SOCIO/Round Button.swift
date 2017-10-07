//
//  Round Button.swift
//  SOCIO
//
//  Created by Hardik Wason on 07/10/17.
//  Copyright © 2017 Hardik Wason. All rights reserved.
//

import UIKit

class Round_Button: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: color_gray, green: color_gray, blue: color_gray, alpha: 0.6).cgColor
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.8
        layer.cornerRadius = self.frame.width / 2
    }
    

}
