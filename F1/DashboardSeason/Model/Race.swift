//
//  Race.swift
//  Formula1
//
//  Created by Matheus Villaça on 25/03/22.
//

import Foundation

final class Race: Codable {
    
    var name: String
    var date: String
    let circuit: Circuit
    
    private enum CodingKeys: String, CodingKey {
        case name = "raceName"
        case circuit = "Circuit"
        case date
    }
    
    init(name: String, date: String, circuitImage: String, circuit: Circuit) {
        self.name = name
        self.date = date
        self.circuit = circuit
    }
}

class Circuit: Codable {
    
    enum ID: String, Codable {
        case bahrain, jeddah, albertPark = "albert_park", imola, miami, catalunya, monaco, BAK, villeneuve, silverstone, redBullRing = "red_bull_ring", ricard, hungaroring, spa, zandvoort, monza, marinaBay = "marina_bay", suzuka, americas, rodriguez, interlagos, yas_marina
    }
    
    let id: ID
    var imageURL: URL? {
        switch id {
        case .miami:
            return URL(string: "")
        default:
            return URL(string: "https://f1templo.com/wp-content/uploads/2020/11/Tracado-iluminado-para-as-corridas-noturnas.-680x330.jpg")
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case id = "circuitId"
    }
}
