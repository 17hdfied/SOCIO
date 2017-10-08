//
//  ViewController.swift
//  SOCIO
//
//  Created by Hardik Wason on 04/10/17.
//  Copyright © 2017 Hardik Wason. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func fb_btnlogin(_ sender: Round_Button) 
 {
        
        let facebookLogin = FBSDKLoginManager()
        
      facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
        if error != nil {
            print("HD: Unable to Authenticate with FB")
        } else if result?.isCancelled == true {
            print("HD: User Cancelled FB auth")
        } else {
            print("HD: Succesfully auth with FB")
            let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
            self.firebaseAuth(credential)
            
        }
        }
      
}
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential) { (user, error) in
            if error != nil
            {
                print("Unable to Sign in with firebase")
            } else {
                print("Successful Sign In buddy")
            }
        }
    }

}
