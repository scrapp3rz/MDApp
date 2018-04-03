//
//  Alerte.swift
//  MyDelightApp
//
//  Created by vincent portier on 25/03/2018.
//  Copyright © 2018 vincent portier. All rights reserved.
//

import UIKit

class ErrorDisplay {
    static let shared = ErrorDisplay()
    func error(message: String, controller: UIViewController) {
        shortMessage(title: "Erreur", message: message, controller: controller)
    }
    
    func shortMessage(title: String, message: String, controller: UIViewController) {
        let errorDisplay = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
        errorDisplay.addAction(ok)
        controller.present(errorDisplay, animated: true, completion: nil)
        
        
    }
    
    
    func UserInputError(title: String, controller: UIViewController, message: String)  {
        let alerte = UIAlertController(title: "Erreur", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
        alerte.addAction(ok)
        controller.present(alerte, animated: true, completion: nil)
        
    }
    
}
