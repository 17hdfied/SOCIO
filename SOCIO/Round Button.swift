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
        
      
        layer.cornerRadius = self.frame.width / 2
    }
    

}
