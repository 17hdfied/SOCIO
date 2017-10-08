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

class Feed: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func signout_btn(_ sender: Any) {
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: Key_chain)
        print("HD: ID removed from keychain \(keychainResult)")
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "gotosignin", sender: nil)
        
        
    }
   
    

   

}
