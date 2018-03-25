//
//  UIExtensions.swift
//  MyDelightApp
//
//  Created by vincent portier on 25/03/2018.
//  Copyright © 2018 vincent portier. All rights reserved.
//

import UIKit


extension UIView {
    
    func chargerXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nameXib = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nameXib, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = bounds
        addSubview(view)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundColor = .white
        return view
        
    }
    
}
