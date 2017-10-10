//
//  PostCell.swift
//  SOCIO
//
//  Created by Hardik Wason on 09/10/17.
//  Copyright © 2017 Hardik Wason. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    @IBOutlet weak var profiling: UIImageView!
    @IBOutlet weak var usernamelbl: UILabel!
    @IBOutlet weak var  postImg: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likeslbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
