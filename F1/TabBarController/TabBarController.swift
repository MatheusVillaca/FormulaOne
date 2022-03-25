//
//  TabBarController.swift
//  Formula1
//
//  Created by Matheus Villaça on 25/03/22.
//

import UIKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.modalPresentationStyle = .fullScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let dashboardSeasonController = DashboardSeasonViewController()
        let dashboardSeasonNavigationController: CustomNavigationController = .init(rootViewController: dashboardSeasonController)
        let dashboardSeasonBarItem = UITabBarItem ( title: "Season" , image: UIImage ( named: "calendar" ) , selectedImage: UIImage ( named: "calendar" ))
        dashboardSeasonController.tabBarItem = dashboardSeasonBarItem
        
        
        dashboardSeasonNavigationController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.viewControllers = [dashboardSeasonController]
    }
    
}
