//
//  Feed.swift
//  SOCIO
//
//  Created by Hardik Wason on 08/10/17.
//  Copyright © 2017 Hardik Wason. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class Feed: UIViewController,UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var addimg: CircleView!
    
        var posts = [Post]()
    var imagePicker: UIImagePickerController!
   static var imageCache: NSCache<NSString, UIImage> = NSCache()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
      
        
        DataServices.ds.REF_POSTS.observe(.value, with: { (snapshot) in
            self.posts = []
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot]
            {
                for snap in snapshot {
                    print("SNAP:\(snap)")
                    if let postDict = snap.value as? Dictionary<String, AnyObject>
                    {
                        let key = snap.key
                        let post = Post(postKey: key, postData: postDict)
                        self.posts.append(post)
                    }
                }
            }
            self.tableview.reloadData()
        })
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            addimg.image = image
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func add_imagetap(_ sender: Any) {
       present(imagePicker,animated: true,completion: nil)
        
        
        
    }
    
    

    
    
    
    
    
    
    
    @IBAction func logout_btn(_ sender: Any) {
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: Key_chain)
        print("HD: ID removed from keychain \(keychainResult)")
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "gotosignin", sender: nil)
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let post = posts[indexPath.row]
        if let cell = tableview.dequeueReusableCell(withIdentifier: "postcell") as? PostCell
        {
            
            if let img = Feed.imageCache.object(forKey: post.imageURL as NSString)
            {
                cell.configureCell(post: post, img: img)
                return cell
            } else {
            cell.configureCell(post: post)
                return cell}
        } else {
            return PostCell()
        }

    }
   
}
