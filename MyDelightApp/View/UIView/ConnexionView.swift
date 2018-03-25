//
//  ConnexionView.swift
//  MyDelightApp
//
//  Created by vincent portier on 25/03/2018.
//  Copyright © 2018 vincent portier. All rights reserved.
//

import UIKit

class ConnexionView: UIView {

    var view: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        view = chargerXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        view = chargerXib()
    }
    
}
