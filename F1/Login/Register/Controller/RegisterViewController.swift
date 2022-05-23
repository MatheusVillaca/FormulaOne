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
        guard let confirmHavePassword = registerView.registerPassword.text?.isEmpty else { return }
        
        if registerView.registerPassword.text == registerView.registerPasswordConfirm.text && !confirmHavePassword && registerView.switchButton.isOn {
            let register: Register = .init(name: name, email: email, password: password, confirmPassword: confirmPassword)
            newUsers.append(register)
            self.dismiss(animated: true, completion: nil)
        } else if !registerView.switchButton.isOn {
            self.showAlert(title: "Oops!", message: "You must agree to the terms of use", style: .alert)
        } else {
            self.showAlert(title: "Oops!", message: "Passwords do not match", style: .alert)
        }
    }
    
    func toggleTermsOfUse() {
        if !registerView.switchButton.isOn {
            registerView.registerConfirmButton.isEnabled = false
            registerView.registerConfirmButton.backgroundColor = .lightGray
        } else {
            registerView.registerConfirmButton.isEnabled = true
            registerView.registerConfirmButton.backgroundColor = .systemBlue
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let updateUsers: Data = try? JSONEncoder().encode(newUsers) {
            UserDefaults.standard.setValue(updateUsers, forKey: "updateUsers")
        
        }
    }
}
