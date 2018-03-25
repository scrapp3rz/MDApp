//
//  mydelightButton.swift
//  MyDelightApp
//
//  Created by vincent portier on 25/03/2018.
//  Copyright © 2018 vincent portier. All rights reserved.
//

import UIKit


class mydelightButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        layer.cornerRadius = 5
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 1
        backgroundColor = .white
        tintColor = UIColor.darkGray
        
    }
    
}
