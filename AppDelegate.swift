//
//  AppDelegate.swift
//  Projeto
//
//  Created by Matheus Villaça on 14/01/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let login: LoginViewController = .init(nibName: nil, bundle: nil)
        let register: RegisterViewController = .init(nibName: nil, bundle: nil)
        let segmented: ClassificationViewController = .init(nibName: nil, bundle: nil)
        
        let navAppearance = UINavigationBarAppearance()
        navAppearance.configureWithOpaqueBackground()
        navAppearance.backgroundColor = .systemRed
        navAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().tintColor = .white
        
        let barAppearance = UITabBarAppearance()
        barAppearance.configureWithOpaqueBackground()
        barAppearance.backgroundColor = .systemRed
        barAppearance.selectionIndicatorTintColor = .white

        let tabViewController: TabBarController = .init()
        tabViewController.tabBar.barTintColor = .systemRed
        tabViewController.tabBar.standardAppearance = barAppearance;
        if #available(iOS 15.0, *) {
            UINavigationBar.appearance().standardAppearance = navAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
            tabViewController.tabBar.scrollEdgeAppearance = tabViewController.tabBar.standardAppearance
        }
        tabViewController.tabBar.tintColor = .white
        tabViewController.tabBar.unselectedItemTintColor = .white
        
        let window: UIWindow = .init(frame: UIScreen.main.bounds)
        let navigationController: UINavigationController = UINavigationController(rootViewController: tabViewController)
        window.rootViewController = navigationController
        self.window = window
        return true
    }
}
