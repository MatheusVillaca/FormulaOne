//
//  ClassificationResponse.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 31/03/22.
//

import Foundation

class ClassificationResponse: Codable {
    let standingsData: StandingsData
    
    private enum CodingKeys: String, CodingKey {
        case standingsData = "MRData"
    }
}

class StandingsData: Codable {
    let xmlns: URL
    let series: String
    let url: URL
    let limit: String
    let offset: String
    let total: String
    let standingsTable: StandingsTable
    
    private enum CodingKeys: String, CodingKey {
        case standingsTable = "StandingsTable"
        case xmlns, series, url, limit, offset, total
    }
}

class StandingsTable: Codable {
    let season: String
    let standingsLists: StandingsLists
    
    private enum CodingKeys: String, CodingKey {
        case standingsLists = "StandingsLists"
        case season
    }
}

class StandingsLists: Codable {
    let driverStandings: [DriversNumbers]
    let round: String
    
    private enum CodingKeys: String, CodingKey {
        case driverStandings = "DriverStandings"
        case round
    }
}
