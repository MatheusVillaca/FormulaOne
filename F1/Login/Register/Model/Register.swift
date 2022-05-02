//
//  Register.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 28/04/22.
//

import Foundation

final class Register: Codable {
    
    let name: String
    let email: String
    let password: String
    let confirmPassword: String
    
    init(name: String, email: String, password: String, confirmPassword: String){
        self.name = name
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
    }
}
