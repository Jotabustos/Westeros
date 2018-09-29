//
//  TabBarPersonalizedViewController.swift
//  Westeros
//
//  Created by Jose Julián Bustos Díaz on 28/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import UIKit

class TabBarPersonalizedViewController: UITabBarController, UITabBarControllerDelegate {

    let firstHouse: House
    let firstSeason: Season
    
    init(firstHouse: House, firstSeason: Season){
        self.firstHouse = firstHouse
        self.firstSeason = firstSeason
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        if viewController.title == "Houses" {
            let houseFirst = HouseDetailViewController(model: firstHouse)
            splitViewController?.viewControllers[1] = houseFirst.wrapperInNavigation()
            
        }
        
        if viewController.title == "Seasons" {
            let seasonFirst = SeasonDetailViewController(model: firstSeason)
            splitViewController?.viewControllers[1] = seasonFirst.wrapperInNavigation()
        }

    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
    

}
