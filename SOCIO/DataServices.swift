//
//  DataServices.swift
//  SOCIO
//
//  Created by Hardik Wason on 10/10/17.
//  Copyright © 2017 Hardik Wason. All rights reserved.
//

import Foundation
import Firebase

let DB_Base = Database.database().reference()
let STORAGE_Base = Storage.storage().reference()

class DataServices {
    
    static let ds = DataServices()
    
    // DB References
    private var _REF_BASE = DB_Base
    private var _REF_POSTS = DB_Base.child("posts")
    private var _REF_USERS = DB_Base.child("users")
    
    //Storage References
    private var _REF_POST_IMAGES = STORAGE_Base.child("post-pics")
    
    
    var REF_BASE : DatabaseReference
    {
        return _REF_BASE
    }
    var REF_POSTS : DatabaseReference
    {
        return _REF_POSTS
    }
    var REF_USERS : DatabaseReference
    {
        return _REF_USERS
    }
    var REF_POST_IMAGES : StorageReference
    {
        return _REF_POST_IMAGES
    }
    
    
    func createFirebaseUser(uid: String, userData: Dictionary<String, String>)
    {
        REF_USERS.child(uid).updateChildValues(userData)
    }
}
