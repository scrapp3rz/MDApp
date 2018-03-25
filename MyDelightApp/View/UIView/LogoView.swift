//
//  LogoView.swift
//  MyDelightApp
//
//  Created by vincent portier on 25/03/2018.
//  Copyright © 2018 vincent portier. All rights reserved.
//

import UIKit

class LogoView: UIView {

    var logoImageVue: UIImageView!


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLogoVue()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLogoVue()
    }
    
    
    func setupLogoVue() {
        logoImageVue = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        logoImageVue.image = #imageLiteral(resourceName: "startView")
        logoImageVue.contentMode = .scaleAspectFit
        logoImageVue.clipsToBounds = true
        addSubview(logoImageVue)
        
    }
    
    
    
    
    
    
    
    
}
