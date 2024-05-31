//
//  AppDelegate.swift
//  TrafficFactoryCase
//
//  Created by Nurşah Ari on 31.05.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navController = UINavigationController()
        appCoordinator = AppCoordinator()
        appCoordinator?.navigationController = navController
        appCoordinator?.start()
        return true
    }
}

