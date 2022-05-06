//
//  RegisterManager.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 28/04/22.
//

import Foundation


final class RegisterManager {
    
    static func getUsers() -> [Register] {
        guard let usersData: Data = UserDefaults.standard.value(forKey: "updateUsers") as? Data,
              let users: [Register] = try? JSONDecoder().decode([Register].self, from: usersData) else {
                  return []
              }
        return users
    }
    
    static func getSavedUsers(email: String, password: String) -> Bool {
        let savedUsers: [Register] = getUsers()
        return !savedUsers.filter({ $0.email == email && $0.password == password }).isEmpty
    }
}
