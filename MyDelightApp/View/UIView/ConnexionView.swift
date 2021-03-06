//
//  ConnexionView.swift
//  MyDelightApp
//
//  Created by vincent portier on 25/03/2018.
//  Copyright © 2018 vincent portier. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ConnexionView: UIView {

    @IBOutlet weak var mailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var validButton: MyDelightButtons!
    
    @IBOutlet weak var FacebookSignInButton: FBSDKButton!
    
    @IBOutlet weak var TwitterConnexionContainer: UIView!
    
    
    
    
    
    var view: UIView!
    var connexionController: ConnexionController?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        view = chargerXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        view = chargerXib()
    }
    
    func addToController(controller: ConnexionController) {
        self.connexionController = controller
    }
    
    @IBAction func validButtonAction(_ sender: Any) {
        connexionController?.validateConnexion(mailAdress: mailTextField.text, passWord: passwordTextField.text)
    }
    
    @IBAction func GoogleSignInButton(_ sender: Any) {
    }
    
    
    
    
    
    
    
    
    
}
