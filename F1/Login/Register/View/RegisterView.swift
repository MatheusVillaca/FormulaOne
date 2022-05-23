//
//  RegisterView.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 28/04/22.
//

import Foundation
import UIKit

protocol DelegateRegisterAction {
    func confirmButton(name: String, email: String, password: String, confirmPassword: String)
    func toggleTermsOfUse()
}

final class RegisterView: UIView, ViewCode {
    
    let registerTitleLabel: UILabel = {
        let registerTitleLabel: UILabel = UILabel(frame: .zero)
        registerTitleLabel.font = registerTitleLabel.font.withSize(30)
        registerTitleLabel.text = "REGISTER"
        registerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return registerTitleLabel
    }()
    
    let nameTitleLabel: UILabel = {
        let nameTitleLabel: UILabel = UILabel(frame: .zero)
        nameTitleLabel.font = nameTitleLabel.font.withSize(15)
        nameTitleLabel.text = "Full Name"
        nameTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameTitleLabel
    }()
   
    let registerName: UITextField = {
        let registerName: UITextField = UITextField(frame: .zero)
        registerName.placeholder = "Full Name"
        registerName.backgroundColor = .white
        registerName.layer.borderWidth = 0.5
        registerName.layer.borderColor = UIColor.black.cgColor
        registerName.layer.cornerRadius = 5
        registerName.translatesAutoresizingMaskIntoConstraints = false
        return registerName
    }()
    
    let emailTitleLabel: UILabel = {
        let emailTitleLabel: UILabel = UILabel(frame: .zero)
        emailTitleLabel.font = emailTitleLabel.font.withSize(15)
        emailTitleLabel.text = "E-Mail"
        emailTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return emailTitleLabel
    }()
    
    let registerEmail: UITextField = {
        let registerEmail: UITextField = UITextField(frame: .zero)
        registerEmail.placeholder = "E-mail"
        registerEmail.backgroundColor = .white
        registerEmail.layer.borderWidth = 0.5
        registerEmail.layer.borderColor = UIColor.black.cgColor
        registerEmail.layer.cornerRadius = 5
        registerEmail.translatesAutoresizingMaskIntoConstraints = false
        return registerEmail
    }()
    
    let passwordTitleLabel: UILabel = {
        let passwordTitleLabel: UILabel = UILabel(frame: .zero)
        passwordTitleLabel.font = passwordTitleLabel.font.withSize(15)
        passwordTitleLabel.text = "Password"
        passwordTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return passwordTitleLabel
    }()
    
    let registerPassword: UITextField = {
        let registerPassword: UITextField = UITextField(frame: .zero)
        registerPassword.placeholder = "Create a Password"
        registerPassword.backgroundColor = .white
        registerPassword.layer.borderWidth = 0.5
        registerPassword.layer.borderColor = UIColor.black.cgColor
        registerPassword.layer.cornerRadius = 5
        registerPassword.translatesAutoresizingMaskIntoConstraints = false
        return registerPassword
    }()
    
    let confirmPasswordTitleLabel: UILabel = {
        let confirmPasswordTitleLabel: UILabel = UILabel(frame: .zero)
        confirmPasswordTitleLabel.font = confirmPasswordTitleLabel.font.withSize(15)
        confirmPasswordTitleLabel.text = "Confirm Password"
        confirmPasswordTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return confirmPasswordTitleLabel
    }()
    
    let registerPasswordConfirm: UITextField = {
        let registerPasswordConfirm: UITextField = UITextField(frame: .zero)
        registerPasswordConfirm.placeholder = "Confirm Password"
        registerPasswordConfirm.backgroundColor = .white
        registerPasswordConfirm.layer.borderWidth = 0.5
        registerPasswordConfirm.layer.borderColor = UIColor.black.cgColor
        registerPasswordConfirm.layer.cornerRadius = 5
        registerPasswordConfirm.translatesAutoresizingMaskIntoConstraints = false
        return registerPasswordConfirm
    }()
    
    let registerConfirmButton: UIButton = {
        let registerConfirmButton: UIButton = UIButton(frame: .zero)
        registerConfirmButton.backgroundColor = .lightGray
        registerConfirmButton.layer.borderColor = UIColor.black.cgColor
        registerConfirmButton.layer.cornerRadius = 8
        registerConfirmButton.layer.borderWidth = 0.5
        registerConfirmButton.setTitle("DONE", for: .normal)
        registerConfirmButton.addTarget(self, action: #selector(registerConfirmAction), for: .touchUpInside)
        registerConfirmButton.translatesAutoresizingMaskIntoConstraints = false
        return registerConfirmButton
    }()
    
    let containerTermsOfUse: UIView = {
        let containerTermsOfUse: UIView = UIView(frame: .zero)
        containerTermsOfUse.translatesAutoresizingMaskIntoConstraints = false
        return containerTermsOfUse
    }()
    
    let termsOfUseLabelView: UILabel = {
        let termsOfUseLabelView: UILabel = UILabel(frame: .zero)
        termsOfUseLabelView.font = termsOfUseLabelView.font.withSize(18)
        termsOfUseLabelView.text = "I agree to the terms of use"
        termsOfUseLabelView.numberOfLines = 0
        termsOfUseLabelView.translatesAutoresizingMaskIntoConstraints = false
        return termsOfUseLabelView
    }()
    
    let switchButton: UISwitch = {
        let switchButton: UISwitch = UISwitch(frame: .zero)
        switchButton.addTarget(self, action: #selector(toggleTermsOfUse), for: .touchUpInside)
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        return switchButton
    }()
    
    
    var delegate: DelegateRegisterAction
    
    @objc func registerConfirmAction() {
        delegate.confirmButton(name: registerName.text ?? "", email: registerEmail.text ?? "", password: registerPassword.text ?? "", confirmPassword: registerPasswordConfirm.text ?? "")
    }
    
    @objc func toggleTermsOfUse() {
        delegate.toggleTermsOfUse()
    }
    
    init(delegate: DelegateRegisterAction){
        self.delegate = delegate
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewHierarchy() {
        addSubview(registerTitleLabel)
        addSubview(nameTitleLabel)
        addSubview(registerName)
        addSubview(emailTitleLabel)
        addSubview(registerEmail)
        addSubview(passwordTitleLabel)
        addSubview(registerPassword)
        addSubview(confirmPasswordTitleLabel)
        addSubview(registerPasswordConfirm)
        addSubview(registerConfirmButton)
        containerTermsOfUse.addSubview(switchButton)
        containerTermsOfUse.addSubview(termsOfUseLabelView)
        addSubview(containerTermsOfUse)
    }
    
    func setupConstraints() {
        
        registerTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        registerTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        nameTitleLabel.topAnchor.constraint(equalTo: registerTitleLabel.bottomAnchor, constant: 5).isActive = true
        nameTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        
        registerName.topAnchor.constraint(equalTo: nameTitleLabel.bottomAnchor, constant: 5).isActive = true
        registerName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        registerName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        
        emailTitleLabel.topAnchor.constraint(equalTo: registerName.bottomAnchor, constant: 5).isActive = true
        emailTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        
        registerEmail.topAnchor.constraint(equalTo: emailTitleLabel.bottomAnchor, constant: 5).isActive = true
        registerEmail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        registerEmail.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        
        passwordTitleLabel.topAnchor.constraint(equalTo: registerEmail.bottomAnchor, constant: 5).isActive = true
        passwordTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        
        registerPassword.topAnchor.constraint(equalTo: passwordTitleLabel.bottomAnchor, constant: 5).isActive = true
        registerPassword.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        registerPassword.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        
        confirmPasswordTitleLabel.topAnchor.constraint(equalTo: registerPassword.bottomAnchor, constant: 5).isActive = true
        confirmPasswordTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        
        registerPasswordConfirm.topAnchor.constraint(equalTo: confirmPasswordTitleLabel.bottomAnchor, constant: 5).isActive = true
        registerPasswordConfirm.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        registerPasswordConfirm.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        
        registerConfirmButton.topAnchor.constraint(equalTo: registerPasswordConfirm.bottomAnchor, constant: 5).isActive = true
        registerConfirmButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        registerConfirmButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        containerTermsOfUse.topAnchor.constraint(equalTo: registerConfirmButton.bottomAnchor, constant: 5).isActive = true
        containerTermsOfUse.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        containerTermsOfUse.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        containerTermsOfUse.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        switchButton.topAnchor.constraint(equalTo: containerTermsOfUse.topAnchor).isActive = true
        switchButton.leadingAnchor.constraint(equalTo: containerTermsOfUse.leadingAnchor).isActive = true
        switchButton.bottomAnchor.constraint(equalTo: containerTermsOfUse.bottomAnchor).isActive = true
        
        termsOfUseLabelView.topAnchor.constraint(equalTo: containerTermsOfUse.topAnchor).isActive = true
        termsOfUseLabelView.leadingAnchor.constraint(equalTo: switchButton.trailingAnchor, constant: 20).isActive = true
        termsOfUseLabelView.bottomAnchor.constraint(equalTo: containerTermsOfUse.bottomAnchor).isActive = true
        
    }
}
