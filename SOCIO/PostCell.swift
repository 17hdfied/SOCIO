//
//  PostCell.swift
//  SOCIO
//
//  Created by Hardik Wason on 09/10/17.
//  Copyright © 2017 Hardik Wason. All rights reserved.
//

import UIKit
import Firebase

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
    func configureCell(post: Post, img: UIImage? = nil)
    {
        self.post = post
        self.caption.text = post.caption
        self.likeslbl.text = "\(post.likes)"
        
        if img != nil {
            self.postImg.image = img
        } else {
            
                let ref = Storage.storage().reference(forURL: post.imageURL)
                ref.getData(maxSize: 2 * 1024 * 1024, completion: { (data, error) in
                    if error != nil {
                        print("HD: Unable to download images")
                    } else {
                        print("HD: Able to download images")
                        if let imgData = data {
                            if let img = UIImage(data: imgData) {
                                self.postImg.image = img
                                Feed.imageCache.setObject(img, forKey: post.imageURL as NSString)
                            }
                        }
                    }
                })
            
        }
        
        
        
        
        
        
    }

}
