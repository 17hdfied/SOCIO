//
//  CircleView.swift
//  SOCIO
//
//  Created by Hardik Wason on 09/10/17.
//  Copyright © 2017 Hardik Wason. All rights reserved.
//

import UIKit

class CircleView: UIImageView {

    override func layoutSubviews() {
         layer.cornerRadius = self.frame.width / 2
    }
}
