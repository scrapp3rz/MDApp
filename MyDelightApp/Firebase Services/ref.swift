//
//  ref.swift
//  MyDelightApp
//
//  Created by vincent portier on 27/03/2018.
//  Copyright © 2018 vincent portier. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

class Ref {
    
    let bdd = Database.database().reference()
    let storage = Storage.storage().reference()
    
    var userRoot: DatabaseReference{ return bdd.child("user") }
    
    func specificUser(id: String) -> DatabaseReference {
        return userRoot.child(id)
        
    }
    
}
