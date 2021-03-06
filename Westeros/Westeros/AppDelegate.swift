//
//  AppDelegate.swift
//  Westeros
//
//  Created by Jose Julián Bustos Díaz on 10/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        // Si window tiene un valor, hazmelo visible. Si es nil, no hace nada
//        window?.backgroundColor = .cyan
        
        // 1. Creamos los Modelos
        let houses = Repository.local.houses
        
        let seasons = Repository.local.seasons
        // 2. Creamos los controladores
        
//        //var controllers = [UIViewController]()
//        let controllers = houses.map { HouseDetailViewController(model: $0).wrapperInNavigation() }
//
//
//        // Creamos el combinador
//        let tabBarViewController = UITabBarController()
//        tabBarViewController.viewControllers = controllers
//
        
        // Crear los controladores
        let houseListViewController = HouseListViewController(model: houses)
        let lastHouseSelected = houseListViewController.lastSelectedHouse()
        
        let seasonListViewController = SeasonListViewController(model: seasons)
        let lastSeasonSelected = seasonListViewController.lastSelectedSeason()
        
        // Detail
        let houseDetailViewController = HouseDetailViewController(model: lastHouseSelected)
        
        // Asignar delegados
        // Un objeto SOLO puede tener un delegado
        // Sin embargo, un objeto, SI puede ser delegado de varios otros
        
        houseListViewController.delegate = houseDetailViewController
        
       // Crear TabBar personalizado pasando como parametros la primera y la ultima casa seleccionada en User Defaults
        
        let tabBarViewController = TabBarPersonalizedViewController(firstHouse: lastHouseSelected, firstSeason: lastSeasonSelected)
        
        tabBarViewController.viewControllers = [houseListViewController.wrapperInNavigation(),seasonListViewController.wrapperInNavigation()]
        
        tabBarViewController.delegate = tabBarViewController
        
        // Crear SplitView
        
        let splitViewController = UISplitViewController()
        
        splitViewController.viewControllers = [tabBarViewController, houseDetailViewController.wrapperInNavigation()]
        
        // Asignamos el rootVC
        
        window?.rootViewController = splitViewController
        window?.makeKeyAndVisible() 
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

