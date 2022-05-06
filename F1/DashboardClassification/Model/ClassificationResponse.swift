//
//  ClassificationResponse.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 31/03/22.
//

import Foundation

class ClassificationResponse: Codable {
    let mrData: MRData

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }

    init(mrData: MRData) {
        self.mrData = mrData
    }
}

class MRData: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let standingsTable: StandingsTable

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case standingsTable = "StandingsTable"
    }

    init(xmlns: String, series: String, url: String, limit: String, offset: String, total: String, standingsTable: StandingsTable) {
        self.xmlns = xmlns
        self.series = series
        self.url = url
        self.limit = limit
        self.offset = offset
        self.total = total
        self.standingsTable = standingsTable
    }
}

class StandingsTable: Codable {
    let season: String
    let standingsLists: [StandingsList]

    enum CodingKeys: String, CodingKey {
        case season
        case standingsLists = "StandingsLists"
    }

    init(season: String, standingsLists: [StandingsList]) {
        self.season = season
        self.standingsLists = standingsLists
    }
}
class StandingsList: Codable {
    let season, round: String
    let driverStandings: [DriverStanding]

    enum CodingKeys: String, CodingKey {
        case season, round
        case driverStandings = "DriverStandings"
    }
}

class DriverStanding: Codable {
    let position, positionText, points, wins: String
    let driver: Driver
    let constructors: [Constructor]

    enum CodingKeys: String, CodingKey {
        case position, positionText, points, wins
        case driver = "Driver"
        case constructors = "Constructors"
    }

    init(position: String, positionText: String, points: String, wins: String, driver: Driver, constructors: [Constructor]) {
        self.position = position
        self.positionText = positionText
        self.points = points
        self.wins = wins
        self.driver = driver
        self.constructors = constructors
    }
}

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

