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

    var post : Post!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(post: Post)
    {
        self.post = post
        self.caption.text = post.caption
        self.likeslbl.text = "\(post.likes)"
        
    }

}
