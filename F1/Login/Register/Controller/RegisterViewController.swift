//
//  RegisterViewController.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 28/04/22.
//

import UIKit

final class RegisterViewController: UIViewController, DelegateRegisterAction {
    
    var newUsers: [Register] = []
    
    lazy var registerView: RegisterView = .init(delegate: self)
    
    override func viewDidLoad() {
        view = registerView
        view.backgroundColor = .white
    }
    
    func showAlert(title: String, message: String, style: UIAlertController.Style) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func confirmButton(name: String, email: String, password: String, confirmPassword: String) {
        if registerView.registerPassword.text == registerView.registerPasswordConfirm.text {
            let register: Register = .init(name: name, email: email, password: password, confirmPassword: confirmPassword)
            newUsers.append(register)
            self.dismiss(animated: true, completion: nil)
        } else {
            self.showAlert(title: "Oops!", message: "Passwords do not match", style: .alert)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let updateUsers: Data = try? JSONEncoder().encode(newUsers) {
            UserDefaults.standard.setValue(updateUsers, forKey: "updateUsers")
        
        }
    }
}
