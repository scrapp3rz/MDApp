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
    var usernameView: UsernameView!
    var myMail: String?
    var myPassword: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboard()
        view.backgroundColor = .white
        logoView = LogoView(frame: view.bounds)
        connexionView = ConnexionView(frame: view.bounds)
        connexionView.addToController(controller: self)
        usernameView = UsernameView(frame: view.bounds)
        usernameView.addController(controller: self)
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
            checkUser(id: id)
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
                Auth.auth().signIn(withEmail: mail, password: mdp, completion: { (user, error) in
                    if let erreur = error {
                        let nsErreur = erreur as NSError
                        if nsErreur.code == 17011 {
                            Auth.auth().createUser(withEmail: mail, password: mdp, completion: {(user, error) in
                                if let erreur = error {
                                    Alerte().simpleError(controller: self, message: erreur.localizedDescription)
                                }
                                if user != nil {
                                    // transition vers UsernameVue
                                    self.transition(to: self.usernameView, transition: .transitionFlipFromRight)
                                }
                            })
                        } else {
                            Alerte().simpleError(controller: self, message: erreur.localizedDescription)

                        }
                    }
                    if let id = user?.uid {
                        // vérifier si l'utilisateur existe déjà
                            self.checkUser(id: id)
                    }
                    
                })
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
    
    func checkUser(id: String) {
        BDD().getUser(id: id) { (user) -> (Void) in
            if user != nil {
                print("User found!")
                ME = user!
                self.goToApp()
            } else {
                print("User not found")
                self.transition(to: self.usernameView, transition: .transitionFlipFromRight)
            }
        }
    }
    
    func goToApp() {
        // instancier le tabBar
        print("en direction de l'appli/tabBar")
        
    }
    
    
    
    
    
}
