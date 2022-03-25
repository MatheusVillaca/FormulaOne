//
//  Race.swift
//  Formula1
//
//  Created by Matheus Villaça on 25/03/22.
//

import Foundation

final class Race: Codable {
    
    var circuitName: String
    var raceDate: String
    var circuitImageName: String
    
    private enum CodingKeys: String, CodingKey {
        case circuitName = "raceName"
        case raceDate = "date"
        case circuitImageName
    }
    
    init(circuitName: String, date: String, circuitImage: String) {
        self.circuitName = circuitName
        self.raceDate = date
        self.circuitImageName = circuitImage
    }
}
