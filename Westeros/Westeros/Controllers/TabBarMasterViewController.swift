//
//  TabBarMasterViewController.swift
//  Westeros
//
//  Created by Jose Julián Bustos Díaz on 28/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import UIKit

class TabBarMasterViewController: UITabBarController, UITabBarControllerDelegate {
    
    let modelHouse : House
    let modelSeason : Season
    
    init(modelHouse: House, modelSeason:Season) {
        self.modelHouse = modelHouse
        self.modelSeason = modelSeason
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
         print("Selected \(viewController.title!)")
        if viewController is HouseListViewController {
            print("First tab")
        } else if viewController is SeasonListViewController {
            print("Second tab")
        }
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


