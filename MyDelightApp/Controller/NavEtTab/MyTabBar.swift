//
//  MyTabBar.swift
//  MyDelightApp
//
//  Created by vincent portier on 28/03/2018.
//  Copyright © 2018 vincent portier. All rights reserved.
//

import UIKit

class MyTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        

        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let fil = FilController(collectionViewLayout: layout)
        let recipe = RecipeController(style: .plain)
        let profile = ProfileController(collectionViewLayout: layout)
        
        
        viewControllers = [
            add(controller: fil, image: #imageLiteral(resourceName: "tab_accueil"), title: "Accueil"),
            add(controller: searchController(), image: #imageLiteral(resourceName: "Search"), title: "recherche"),
            add(controller: publicationController(), image: #imageLiteral(resourceName: "tab_photo"), title: "Ajouter"),
            add(controller: recipe, image: #imageLiteral(resourceName: "tab_notif"), title: "Recettes"),
            add(controller: profile, image: #imageLiteral(resourceName: "profil"), title: "Profil")
            
        ]
        
        
        
    }

    
    
    
    func add(controller: UIViewController, image: UIImage, title: String) -> UINavigationController {
        let nav = MyNav(rootViewController: controller)
        nav.tabBarItem.image = image
        nav.tabBarItem.title = title
        return nav
    }

    
    
    
    
    

}
