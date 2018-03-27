//
//  UsernameView.swift
//  MyDelightApp
//
//  Created by vincent portier on 27/03/2018.
//  Copyright © 2018 vincent portier. All rights reserved.
//

import UIKit

class UsernameView: UIView {

    var vue: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        vue = chargerXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        vue = chargerXib()
    }
    

}
