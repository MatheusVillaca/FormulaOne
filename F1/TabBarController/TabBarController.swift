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
        
        let seasonController = SeasonViewController()
        let seasonNavigationController: UINavigationController = .init(rootViewController: seasonController)
        let seasonBarItem = UITabBarItem (title: "Calendar" ,image: UIImage(named: "calendar"), selectedImage: UIImage(named: "calendar"))
        seasonNavigationController.tabBarItem = seasonBarItem
        
        let classificationController = ClassificationViewController()
        let classificationNavigationController: UINavigationController = .init(rootViewController: classificationController)
        let classificationBarItem = UITabBarItem(title: "Standings", image: UIImage(named: "standings"), selectedImage: UIImage(named: "standings"))
        classificationController.tabBarItem = classificationBarItem
        
        let teamsController = TeamsViewController()
        let teamsNavigationController: UINavigationController = .init(rootViewController: classificationController)
        let teamsBarItem = UITabBarItem(title: "Teams", image: UIImage(named: "teams"), selectedImage: UIImage(named: "teams"))
        teamsController.tabBarItem = teamsBarItem
        
        teamsNavigationController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        seasonNavigationController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        classificationNavigationController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.viewControllers = [seasonController, teamsController, classificationController]
    }
}
