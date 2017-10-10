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

class Feed: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
           tableview.delegate = self
        tableview.dataSource = self
        
        DataServices.ds.REF_POSTS.observe(.value, with: { (snapshot) in
            print(snapshot.value)
        })
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
        return 3
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableview.dequeueReusableCell(withIdentifier: "postcell") as! PostCell
    }
   
}
