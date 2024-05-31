//
//  AppCoordinator.swift
//  TrafficFactoryCase
//
//  Created by Nurşah Ari on 31.05.2024.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var window: UIWindow
    var navigationController: UINavigationController?
    
    init(){
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        let viewModel = ItemsViewModel()
        let viewController = ItemsViewController(viewModel: viewModel)
        
        let navigationController = UINavigationController(rootViewController: viewController)
        self.navigationController = navigationController
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
