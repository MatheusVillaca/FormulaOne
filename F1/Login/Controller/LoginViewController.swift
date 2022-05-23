//
//  LoginViewController.swift
//  Formula1
//
//  Created by Matheus Villaça on 16/03/22.
//

import UIKit

final class LoginViewController: UIViewController, DelegateActions {
    
    lazy var loginView = LoginView(delegate: self, logo: UIImage(named: "f1.png"))
    
    override func viewDidLoad() {
        view = loginView
        view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundLogin")!) 

    }
    
    func showAlert(title: String, message: String, style: UIAlertController.Style) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func loginAction() {
        guard let verifyNameField = loginView.nameField.text?.isEmpty else { return }
        guard let verifyKeyField = loginView.keyField.text?.isEmpty else { return }
        
        if RegisterManager.getSavedUsers(email: loginView.nameField.text ?? "", password: loginView.keyField.text ?? "") && !verifyNameField && !verifyKeyField {
            let tabBarController = TabBarController()
            present(tabBarController, animated: true, completion: nil)
        } else if verifyNameField || verifyKeyField {
            self.showAlert(title: "Oops", message: "Fill in the fields correctly.", style: .alert)
        } else {
            self.showAlert(title: "Oops", message: "Username or password not found", style: .alert)
        }
    }
    
    func register() {
        present(RegisterViewController(), animated: true, completion: nil)
    }
}
