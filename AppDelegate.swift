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
        let tab: TabBarController = .init(nibName: nil, bundle: nil)
        let register: RegisterViewController = .init(nibName: nil, bundle: nil)
        let segmented: ClassificationViewController = .init(nibName: nil, bundle: nil)
        
        let window: UIWindow = .init(frame: UIScreen.main.bounds)
        window.rootViewController = segmented
        self.window = window
        return true
    }
}
