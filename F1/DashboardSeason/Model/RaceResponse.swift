//
//  RaceResponse.swift
//  Formula1
//
//  Created by Matheus Villaça on 25/03/22.
//

import Foundation

class SeasonResponse: Codable {
    let seasonData: SeasonData
    
    private enum CodingKeys: String, CodingKey {
        case seasonData = "MRData"
    }
}

class SeasonData: Codable {
    let xmlns: URL
    let series: String
    let url: URL
    let limit: String
    let offset: String
    let total: String
    let raceTable: RaceTable
    
    private enum CodingKeys: String, CodingKey {
        case raceTable = "RaceTable"
        case xmlns, series, url, limit, offset, total
    }
}

class RaceTable: Codable {
    let season: String
    let races: [Race]
    
    private enum CodingKeys: String, CodingKey {
        case races = "Races"
        case season
    }
}
