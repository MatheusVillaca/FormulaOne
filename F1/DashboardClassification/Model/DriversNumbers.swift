//
//  Classification.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 30/03/22.
//

import Foundation

final class DriversNumbers: Codable {
    
    var firstName: String
    var lastName: String?
    var position: String
    var points: String
    var round: String
    
    private enum CodingKeys: String, CodingKey {
        case firstName = "givenName"
        case lastName = "familyName"
        case position, points, round
    }
    
    init(firstName: String, lastName: String?, position: String, points: String, round: String) {
        self.firstName = firstName
        self.position = position
        self.points = points
        self.lastName = lastName
        self.round = round
    }
}
