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

class DataServices {
    
    static let ds = DataServices()
    
    private var _REF_BASE = DB_Base
    private var _REF_POSTS = DB_Base.child("posts")
    private var _REF_USERS = DB_Base.child("users")
    
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
    
    func createFirebaseUser(uid: String, userData: Dictionary<String, String>)
    {
        REF_USERS.child(uid).updateChildValues(userData)
    }
}
