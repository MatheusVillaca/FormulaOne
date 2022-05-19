//
//  Constructor.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 13/05/22.
//

import Foundation

class Constructor: Codable {
    let constructorID: String
    let url: String
    let name, nationality: String

    enum CodingKeys: String, CodingKey {
        case constructorID = "constructorId"
        case url, name, nationality
    }

    init(constructorID: String, url: String, name: String, nationality: String) {
        self.constructorID = constructorID
        self.url = url
        self.name = name
        self.nationality = nationality
    }
}
