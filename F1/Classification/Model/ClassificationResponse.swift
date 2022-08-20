import Foundation

class ClassificationResponse: Codable {
    let mrData: MRDataStanding

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }

    init(mrData: MRDataStanding) {
        self.mrData = mrData
    }
}

class MRDataStanding: Codable {
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
    let driverStandings: [DriverStandings]?
    let constructorStandings: [ConstructorStanding]?

    enum CodingKeys: String, CodingKey {
        case season, round
        case driverStandings = "DriverStandings"
        case constructorStandings = "ConstructorStandings"
    }
}

class ConstructorStanding: Codable {
    let position, positionText, points, wins: String
    let constructor: Constructor

    enum CodingKeys: String, CodingKey {
        case position, positionText, points, wins
        case constructor = "Constructor"
    }

    init(position: String, positionText: String, points: String, wins: String, constructor: Constructor) {
        self.position = position
        self.positionText = positionText
        self.points = points
        self.wins = wins
        self.constructor = constructor
    }
}

class DriverStandings: Codable {
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

