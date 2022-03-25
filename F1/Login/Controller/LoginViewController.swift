//
//  LoginViewController.swift
//  Formula1
//
//  Created by Matheus Villaça on 16/03/22.
//

import UIKit

final class LoginViewController: UIViewController, DelegateActions {
    
    lazy var loginView = LoginView(delegate: self, terms: "Concordo com os termos de uso", logo: UIImage(named: "f1.png"))
    
    override func viewDidLoad() {
        view = loginView
        view.backgroundColor = .white
    }
    
    func showAlert(title: String, message: String, style: UIAlertController.Style) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func loginAction() {
        guard let verifyNameField = loginView.nameField.text?.isEmpty else {return}
        guard let verifyKeyField = loginView.keyField.text?.isEmpty else {return}
        if loginView.switchButton.isOn && !verifyNameField && !verifyKeyField {
            let tabBarController = TabBarController()
            present(tabBarController, animated: true, completion: nil)
        } else if verifyNameField || verifyKeyField {
            self.showAlert(title: "Oops", message: "Preencha os campos corretamente.", style: .alert)
        }
    }
    
    func toggleTermsOfUse() {
        loginView.loginButton.isEnabled = loginView.switchButton.isOn
        loginView.loginButton.alpha = loginView.switchButton.isOn ? 1.0 : 0.5
        loginView.loginButton.backgroundColor = loginView.switchButton.isOn ? #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1) : .lightGray
    }
    
}
