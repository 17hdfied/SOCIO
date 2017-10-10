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
import SwiftKeychainWrapper

class SignInVC: UIViewController {
    @IBOutlet weak var email_field: UITextField!
    @IBOutlet weak var password_field: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: Key_chain) {
            performSegue(withIdentifier:"gotofeed" , sender: nil)
        }
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
                if let user = user
                {   let userData = ["provider":credential.provider]
                    self.completeSignInid(id: user.uid, userData: userData)
                }
            }
        }
    }
    
    @IBAction func signin_tap(_ sender: Any) {
        if let email = email_field.text, let pwd = password_field.text {
            Auth.auth().signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                print("HD: email user auth with Firebase")
                    if user == user{
                        let userData = ["provider":user?.providerID]
                        self.completeSignInid(id: (user?.uid)!, userData:userData as! Dictionary<String, String>) }
                }else {
                   Auth.auth().createUser(withEmail: email, password: pwd, completion: { (user, error) in
                    if error != nil {
                        print("HD: Unable to auth with firebase using E-mail")
                    } else {
                        print("HD: Successfully auth with Firebase using E-mail")
                        if user == user {
                             let userData = ["provider":user?.providerID]
                            self.completeSignInid(id: (user?.uid)!, userData: userData as! Dictionary<String, String>)
                        }
                    }
                   })
                }
        })
        
        
        
        }
        
    }
    
    
    func completeSignInid(id: String,userData:Dictionary<String, String>)
    {
        DataServices.ds.createFirebaseUser(uid: id, userData: userData)
      let keychainresult =  KeychainWrapper.standard.set(id, forKey: Key_chain)
        print("HD: data saved in keychain successfully \(keychainresult)")
        performSegue(withIdentifier: "gotofeed", sender: nil)
    
    }
    
    
    
    

}
