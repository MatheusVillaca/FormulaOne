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
}

final class LoginView: UIView, ViewCode {
    
//    let scrollView: UIScrollView = {
//        let scrollView: UIScrollView = UIScrollView(frame: .zero)
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        return scrollView
//    }()
    
    let containerTermsOfUse: UIView = {
        let containerTermsOfUse: UIView = UIView(frame: .zero)
        containerTermsOfUse.translatesAutoresizingMaskIntoConstraints = false
        return containerTermsOfUse
    }()
    
    let stackView: UIStackView = {
        let stackView: UIStackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let logoLogin: UIImageView = {
        let logoLogin: UIImageView = UIImageView(frame: .zero)
        logoLogin.translatesAutoresizingMaskIntoConstraints = false
        return logoLogin
    }()
    
    let nameField: UITextField = {
        let nameField: UITextField = UITextField(frame: .zero)
        nameField.placeholder = "User"
        nameField.backgroundColor = .white
        nameField.layer.borderWidth = 0.5
        nameField.layer.borderColor = UIColor.black.cgColor
        nameField.layer.cornerRadius = 5
        nameField.translatesAutoresizingMaskIntoConstraints = false
        return nameField
    }()
    
    let keyField: UITextField = {
        let keyField: UITextField = UITextField(frame: .zero)
        keyField.placeholder = "Key"
        keyField.backgroundColor = .white
        keyField.layer.borderWidth = 0.5
        keyField.layer.borderColor = UIColor.black.cgColor
        keyField.layer.cornerRadius = 5
        keyField.isSecureTextEntry = true
        keyField.translatesAutoresizingMaskIntoConstraints = false
        return keyField
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
        loginButton.setTitle("ENTRAR", for: .normal)
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
    
    func setupViewHierarchy() {
        addSubview(stackView)
        containerTermsOfUse.addSubview(switchButton)
        containerTermsOfUse.addSubview(termsOfUseLabelView)
//        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(logoLogin)
        stackView.addArrangedSubview(nameField)
        stackView.addArrangedSubview(keyField)
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(containerTermsOfUse)
    }
    
    func setupConstraints() {
        
//        scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
//        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//        scrollView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        logoLogin.heightAnchor.constraint(equalToConstant: 180).isActive = true

        nameField.heightAnchor.constraint(equalToConstant: 30).isActive = true

        keyField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        switchButton.topAnchor.constraint(equalTo: containerTermsOfUse.topAnchor).isActive = true
        switchButton.leadingAnchor.constraint(equalTo: containerTermsOfUse.leadingAnchor).isActive = true
        switchButton.trailingAnchor.constraint(equalTo: termsOfUseLabelView.leadingAnchor, constant: 5).isActive = true
        switchButton.bottomAnchor.constraint(equalTo: containerTermsOfUse.bottomAnchor).isActive = true
        
        termsOfUseLabelView.topAnchor.constraint(equalTo: containerTermsOfUse.topAnchor).isActive = true
        termsOfUseLabelView.leadingAnchor.constraint(equalTo: switchButton.trailingAnchor, constant: -5).isActive = true
        termsOfUseLabelView.trailingAnchor.constraint(equalTo: containerTermsOfUse.trailingAnchor).isActive = true
        termsOfUseLabelView.bottomAnchor.constraint(equalTo: containerTermsOfUse.bottomAnchor).isActive = true

    }
    
}
