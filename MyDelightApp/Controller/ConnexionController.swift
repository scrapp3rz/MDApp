//
//  ConnexionController.swift
//  MyDelightApp
//
//  Created by vincent portier on 25/03/2018.
//  Copyright © 2018 vincent portier. All rights reserved.
//

import UIKit
import FirebaseAuth

class ConnexionController: UIViewController {

    
    var logoView: LogoView!
    var connexionView: ConnexionView!
    var currentView: UIView!
    var myMail: String?
    var myPassword: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        logoView = LogoView(frame: view.bounds)
        connexionView = ConnexionView(frame: view.bounds)
        connexionView.addToController(controller: self)
        view.addSubview(logoView)
        currentView = logoView
        
        /*
         A faire :
         - montrer logo (image accueil)
         - afficher une vue avec identification
         - verifier si user existe
         - afficher une vue pour enregistrer un user avec username unique
         */
        
        

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let id = Auth.auth().currentUser?.uid {
            // passer à l'application
        } else {
            // passer à vue d'identification
            transition(to: connexionView, transition: .transitionFlipFromRight)
            
        }
    }
    
    func validateConnexion (mailAdress: String?, passWord: String?) {
        myMail = mailAdress
        myPassword = passWord
        
        if let mail = myMail, mail != "" {
            if let mdp = myPassword, myPassword != "" {
                
            } else {
                Alerte().simpleError(controller: self, message: "Vous devez entrer un mot de passe")
            }
        } else {
            Alerte().simpleError(controller: self, message: "Vous devez entrer une adresse mail")
        }
        
    }

    
    func transition(to: UIView, transition: UIViewAnimationOptions) {
        UIView.transition(from: currentView, to: to, duration: 0.8, options: transition) {(success) in
            self.currentView = to
        }
    }
    
    
    
    
    
    
    
    
    
}
