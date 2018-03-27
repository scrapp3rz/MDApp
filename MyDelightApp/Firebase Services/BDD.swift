//
//  BDD.swift
//  MyDelightApp
//
//  Created by vincent portier on 27/03/2018.
//  Copyright © 2018 vincent portier. All rights reserved.
//

import Foundation
import FirebaseDatabase

class BDD {
    
    func checkIfUserExist(id: String, completion: UserCompletion?) {
        Ref().specificUser(id: id).observe(.value) { (snapshot) in
            if snapshot.exists(), let _ = snapshot.value as?[String: AnyObject] {
                completion?(User(snapshot: snapshot))
            } else {
                completion?(nil)
            }
        }
        
    }
    
    func usernameExist(username: String, completion: successCompletion?) {
        Ref().userRoot.queryOrdered(byChild: "username").queryEqual(toValue: username).observeSingleEvent(of: .value) {(snapshot) in
            if !snapshot.exists() {
                completion?(true, "")
            } else {
                completion?(false, "Nom d'utilisateur déjà pris")
            }
        }
    }
    
    
    func updateUser(id: String, dict: [String: AnyObject], completion: @escaping UserCompletion) {
        Ref().specificUser(id: id).updateChildValues(dict) { (error, ref) in
            if error == nil{
                self.checkIfUserExist(id: id, completion: { (user) -> (Void) in
                    completion(user)
                })
            }
        }
    }
    
    
    
    
    
    
    
    
}
