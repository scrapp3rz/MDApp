//
//  UsernameView.swift
//  MyDelightApp
//
//  Created by vincent portier on 27/03/2018.
//  Copyright © 2018 vincent portier. All rights reserved.
//

import UIKit

class UsernameView: UIView {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    var vue: UIView!
    var connexionController: ConnexionController?
    var canCreateUsername = false
    
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        vue = chargerXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        vue = chargerXib()
    }
    
    func addController(controller: ConnexionController) {
        self.connexionController = controller
        usernameTextField.addTarget(self, action: #selector(textUpdated), for: .editingChanged)
    }
    
    @IBAction func validerButton(_ sender: Any) {
        
    }

    @IBAction func backButton(_ sender: Any) {
        connexionController?.transition(to: (connexionController?.connexionView)!, transition: .transitionFlipFromLeft)
    }
    
    @objc func textUpdated(_ textField: UITextField) {
        guard let newUsername = textField.text else { return }
        if newUsername == "" {
            canCreateUsername = false
            errorLabel.text = "Vous devez choisir un nom d'utilisateur"
        } else if newUsername .contains(" ") {
            canCreateUsername = false
            errorLabel.text = "Votre nom d'utilisateur ne peut pas comporter d'espace"
        } else if newUsername.count >= 21 {
            canCreateUsername = false
            errorLabel.text = "Nom d'utilisateur trop long"
        } else {
            BDD().usernameExist(username: newUsername, completion: { (success, error) -> (Void) in
                guard success != nil,
                    error != nil else { return }
                self.canCreateUsername = success!
                self.errorLabel.text = error!
                
                
            })
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}

