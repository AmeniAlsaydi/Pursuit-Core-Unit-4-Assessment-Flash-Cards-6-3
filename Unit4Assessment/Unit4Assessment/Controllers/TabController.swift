//
//  TabController.swift
//  Unit4Assessment
//
//  Created by Amy Alsaydi on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class TabController: UITabBarController {
    
    private var datapersistance = DataPersistence<Card>(filename: "cards.plist")
    
    private lazy var cardsVC: CardsController = {
       let vc = CardsController()
         vc.datapersistance = datapersistance
          vc.datapersistance.delegate = vc
        vc.tabBarItem = UITabBarItem(title: "My Cards", image: UIImage(systemName: "rectangle.on.rectangle.angled"), tag: 0)
        return vc
    }()
    
    private lazy var createVC: CreateController = {
       let vc = CreateController()
         vc.datapersistance = datapersistance
        vc.tabBarItem = UITabBarItem(title: "Create", image: UIImage(systemName: "pencil.and.ellipsis.rectangle"), tag: 1)
        return vc
    }()
    
    private lazy var searchVC: SearchController = {
          let vc = SearchController()
            vc.datapersistance = datapersistance
           vc.tabBarItem = UITabBarItem(title: "Find", image: UIImage(systemName: "magnifyingglass.circle"), tag: 2)
           return vc
       }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [UINavigationController(rootViewController: cardsVC),
                           UINavigationController(rootViewController: createVC),
                           UINavigationController(rootViewController: searchVC)]
    }
}
