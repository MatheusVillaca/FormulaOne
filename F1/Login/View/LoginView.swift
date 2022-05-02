//
//  LoginView.swift
//  Formula1
//
//  Created by Matheus Villaça on 16/03/22.
//

import UIKit

protocol DelegateActions {
    func loginAction()
    func toggleTermsOfUse()
    func register()
}

final class LoginView: UIView, ViewCode {
    
    let logoLogin: UIImageView = {
        let logoLogin: UIImageView = UIImageView(frame: .zero)
        logoLogin.translatesAutoresizingMaskIntoConstraints = false
        return logoLogin
    }()
    
    let nameField: UITextField = {
        let nameField: UITextField = UITextField(frame: .zero)
        nameField.placeholder = "E-mail"
        nameField.backgroundColor = .white
        nameField.layer.borderWidth = 0.5
        nameField.layer.borderColor = UIColor.black.cgColor
        nameField.layer.cornerRadius = 5
        nameField.translatesAutoresizingMaskIntoConstraints = false
        return nameField
    }()
    
    let keyField: UITextField = {
        let keyField: UITextField = UITextField(frame: .zero)
        keyField.placeholder = "Password"
        keyField.backgroundColor = .white
        keyField.layer.borderWidth = 0.5
        keyField.layer.borderColor = UIColor.black.cgColor
        keyField.layer.cornerRadius = 5
        keyField.isSecureTextEntry = true
        keyField.translatesAutoresizingMaskIntoConstraints = false
        return keyField
    }()
    
    let containerTermsOfUse: UIView = {
        let containerTermsOfUse: UIView = UIView(frame: .zero)
        containerTermsOfUse.translatesAutoresizingMaskIntoConstraints = false
        return containerTermsOfUse
    }()
    
    let termsOfUseLabelView: UILabel = {
        let termsOfUseLabelView: UILabel = UILabel(frame: .zero)
        termsOfUseLabelView.font = termsOfUseLabelView.font.withSize(18)
        termsOfUseLabelView.numberOfLines = 0
        termsOfUseLabelView.translatesAutoresizingMaskIntoConstraints = false
        return termsOfUseLabelView
    }()
    
    let loginButton: UIButton = {
        let loginButton: UIButton = UIButton(frame: .zero)
        loginButton.backgroundColor = .lightGray
        loginButton.layer.borderColor = UIColor.black.cgColor
        loginButton.layer.cornerRadius = 8
        loginButton.layer.borderWidth = 0.5
        loginButton.setTitle("LOGIN", for: .normal)
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        return loginButton
    }()
    
    let switchButton: UISwitch = {
        let switchButton: UISwitch = UISwitch(frame: .zero)
        switchButton.addTarget(self, action: #selector(toggleTermsOfUse), for: .touchUpInside)
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        return switchButton
    }()
    
    let register: UIButton = {
        let register: UIButton = UIButton(frame: .zero)
        register.setTitle("REGISTER", for: .normal)
        register.setTitleColor(UIColor.systemBlue, for: .normal)
        register.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
        register.translatesAutoresizingMaskIntoConstraints = false
        return register
    }()
    
    var delegate: DelegateActions?
    
    init(delegate: DelegateActions, terms: String, logo: UIImage?) {
        super.init(frame: .zero)
        self.logoLogin.image = logo
        self.delegate = delegate
        self.termsOfUseLabelView.text = terms
        backgroundColor = .none
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func loginAction() {
        delegate?.loginAction()
    }
    
    @objc func toggleTermsOfUse() {
        delegate?.toggleTermsOfUse()
    }
    
    @objc func registerAction() {
        delegate?.register()
    }
    
    func setupViewHierarchy() {
        addSubview(logoLogin)
        containerTermsOfUse.addSubview(switchButton)
        containerTermsOfUse.addSubview(termsOfUseLabelView)
        addSubview(nameField)
        addSubview(keyField)
        addSubview(loginButton)
        addSubview(containerTermsOfUse)
        addSubview(register)
    }
    
    func setupConstraints() {
        
        logoLogin.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        logoLogin.bottomAnchor.constraint(equalTo: nameField.topAnchor, constant: -5).isActive = true
        logoLogin.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        logoLogin.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        logoLogin.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        nameField.topAnchor.constraint(equalTo: logoLogin.bottomAnchor, constant: 5).isActive = true
        nameField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        nameField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        nameField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        keyField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 5).isActive = true
        keyField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        keyField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        keyField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        loginButton.topAnchor.constraint(equalTo: keyField.bottomAnchor, constant: 5).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        containerTermsOfUse.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 5).isActive = true
        containerTermsOfUse.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        containerTermsOfUse.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        containerTermsOfUse.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        switchButton.topAnchor.constraint(equalTo: containerTermsOfUse.topAnchor).isActive = true
        switchButton.leadingAnchor.constraint(equalTo: containerTermsOfUse.leadingAnchor).isActive = true
        switchButton.bottomAnchor.constraint(equalTo: containerTermsOfUse.bottomAnchor).isActive = true
        
        termsOfUseLabelView.topAnchor.constraint(equalTo: containerTermsOfUse.topAnchor).isActive = true
        termsOfUseLabelView.leadingAnchor.constraint(equalTo: switchButton.trailingAnchor, constant: 20).isActive = true
        termsOfUseLabelView.bottomAnchor.constraint(equalTo: containerTermsOfUse.bottomAnchor).isActive = true
        
        register.topAnchor.constraint(equalTo: containerTermsOfUse.bottomAnchor, constant: 25).isActive = true
        register.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        register.heightAnchor.constraint(equalToConstant: 20).isActive = true
        register.widthAnchor.constraint(equalToConstant: 100).isActive = true

    }
    
}
