//
//  NavigationController.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 29/05/22.
//

import UIKit

final class CustomNavigationController: UINavigationController {
    
//    func push(controller: UIViewController, animated: Bool, title: String) {
//        controller.navigationController?.pushViewController(controller, animated: animated)
//        controller.navigationItem.title = title
//    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
