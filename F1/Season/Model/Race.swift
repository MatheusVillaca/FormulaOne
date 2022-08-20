import Foundation

// MARK: - SeasonData
class SeasonData: Codable {
    let mrData: MRData

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }

    init(mrData: MRData) {
        self.mrData = mrData
    }
}

// MARK: - MRData
class MRData: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let raceTable: RaceTable

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case raceTable = "RaceTable"
    }

    init(xmlns: String, series: String, url: String, limit: String, offset: String, total: String, raceTable: RaceTable) {
        self.xmlns = xmlns
        self.series = series
        self.url = url
        self.limit = limit
        self.offset = offset
        self.total = total
        self.raceTable = raceTable
    }
}

// MARK: - RaceTable
class RaceTable: Codable {
    let season: String
    let races: [Race]

    enum CodingKeys: String, CodingKey {
        case season
        case races = "Races"
    }

    init(season: String, races: [Race]) {
        self.season = season
        self.races = races
    }
}

// MARK: - Race
class Race: Codable {
    let season, round: String
    let url: String
    let raceName: String
    let circuit: Circuit
    let date, time: String
    let firstPractice, secondPractice: FirstPractice
    let thirdPractice: FirstPractice?
    let qualifying: FirstPractice
    let sprint: FirstPractice?

    enum CodingKeys: String, CodingKey {
        case season, round, url, raceName
        case circuit = "Circuit"
        case date, time
        case firstPractice = "FirstPractice"
        case secondPractice = "SecondPractice"
        case thirdPractice = "ThirdPractice"
        case qualifying = "Qualifying"
        case sprint = "Sprint"
    }

    init(season: String, round: String, url: String, raceName: String, circuit: Circuit, date: String, time: String, firstPractice: FirstPractice, secondPractice: FirstPractice, thirdPractice: FirstPractice?, qualifying: FirstPractice, sprint: FirstPractice?) {
        self.season = season
        self.round = round
        self.url = url
        self.raceName = raceName
        self.circuit = circuit
        self.date = date
        self.time = time
        self.firstPractice = firstPractice
        self.secondPractice = secondPractice
        self.thirdPractice = thirdPractice
        self.qualifying = qualifying
        self.sprint = sprint
    }
}

// MARK: - Circuit
class Circuit: Codable {
    let circuitID: ID
    let url: String
    let circuitName: String
    let location: Location

    enum CodingKeys: String, CodingKey {
        case circuitID = "circuitId"
        case url, circuitName
        case location = "Location"
    }

    init(circuitID: ID, url: String, circuitName: String, location: Location) {
        self.circuitID = circuitID
        self.url = url
        self.circuitName = circuitName
        self.location = location
    }
    
    enum ID: String, Codable {
            case bahrain, jeddah, albertPark = "albert_park", imola, miami, catalunya, monaco, baku, villeneuve, silverstone, redBullRing = "red_bull_ring", ricard, hungaroring, spa, zandvoort, monza, marinaBay = "marina_bay", suzuka, americas, rodriguez, interlagos, yasMarina = "yas_marina"
        }

    var imageURL: URL? {
        switch circuitID {
        case .bahrain:
            return URL(string: "https://f1templo.com/wp-content/uploads/2020/11/Tracado-iluminado-para-as-corridas-noturnas.-680x330.jpg")
        case .jeddah:
            return URL(string: "https://s3-eu-west-1.amazonaws.com/racingnews-v2-prod/_1125x633_crop_center-center_85_none/Jeddah-7.jpg?v=1646242355")
        case .albertPark:
            return URL(string: "https://s2.glbimg.com/4MGJRco936NV268Zq84FJ-s9r_Q=/0x0:700x350/924x0/smart/filters:strip_icc()/s.glbimg.com/es/ge/f/original/2016/03/08/melbournef1_blog.jpg")
        case .imola:
            return URL(string: "https://cdn-1.motorsport.com/images/amp/YBeWx5v2/s1000/imola-motor-valley-fest-1.jpg")
        case .miami:
            return URL(string: "https://www.grandepremio.com.br/wp-content/uploads/2022/01/GP-Miami.jpg")
        case .catalunya:
            return URL(string: "https://i0.wp.com/www.asphaltandrubber.com/wp-content/uploads/2014/06/Circuit-de-Catalunya-Aerial.jpg?fit=1280%2C914&ssl=1")
        case .monaco:
            return URL(string: "https://ogimg.infoglobo.com.br/in/24315958-a09-8d4/FT1086A/Monaco-Monte-Carlo.jpg")
        case .baku:
            return URL(string: "https://www.formula1.com/content/dam/fom-website/manual/Misc/ROAD_TO_F1/rsz_1015130123-lat-20180428-_onz8939.jpg")
        case .villeneuve:
            return URL(string: "https://www.autoracing.com.br/wp-content/uploads/2013/06/circuito-gilles-villeneuve.jpg")
        case .silverstone:
            return URL(string: "https://cdn-wp.thesportsrush.com/2020/07/Silverstone-GP.jpg")
        case .redBullRing:
                return URL(string: "https://cdn-1.motorsport.com/images/amp/0a54RQy0/s1000/f1-austrian-gp-2018-red-bull-r.jpg")
        case .ricard:
            return URL(string: "https://www.autoracing.com.br/wp-content/uploads/2016/12/paul-ricard-franca-vista-aerea700.jpg")
        case .hungaroring:
            return URL(string: "https://blogstartsports.com.br/wp-content/uploads/2014/07/Hungaroring.png")
        case .spa:
            return URL(string: "https://photos.grandprix.com/jpeg/races/pbel21/fri/alp/alonso19-lg.jpg")
        case .zandvoort:
            return URL(string: "https://www.autoracing.com.br/wp-content/uploads/2018/11/f1-zandvoort-holanda730.jpg")
        case .monza:
            return URL(string: "https://www.fnvsports.com.br/wp-content/uploads/2021/09/GP-da-Italia-de-F1-2021.jpeg")
        case .marinaBay:
            return URL(string: "https://img.etimg.com/thumb/msid-71212149,width-640,resizemode-4,imgsize-706393/speed-up.jpg")
        case .suzuka:
            return URL(string: "https://auto-drive.pt/wp-content/uploads/2021/08/Japan.jpg")
        case .americas:
            return URL(string: "http://s2.glbimg.com/ZsTz9J3cOrAXdjWqxkWGmE6rfzM=/smart/s.glbimg.com/es/ge/f/original/2016/04/11/track1.jpg")
        case .rodriguez:
            return URL(string: "https://www.autodashboard.com.br/wp-content/uploads/2021/11/gp-do-mexico-2021.jpg")
        case .interlagos:
            return URL(string: "https://s2.glbimg.com/HTtoh6zsaCL0THrbNKC23j6cCA0=/0x0:3189x1390/1008x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2021/i/m/FGggffSEOkukTpPAYigw/interlagos2.jpg")
        case .yasMarina:
            return URL(string: "https://s2.glbimg.com/-C-fZgGLnFIXypk7JwUBvmJrdbo=/0x0:1792x828/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_bc8228b6673f488aa253bbcb03c80ec5/internal_photos/bs/2021/a/a/jioQUyRZq1fuAVKQArEw/circuito-abu-dhabi.jpg")
        }
    }
}

// MARK: - Location
class Location: Codable {
    let lat, long, locality, country: String

    init(lat: String, long: String, locality: String, country: String) {
        self.lat = lat
        self.long = long
        self.locality = locality
        self.country = country
    }
}

// MARK: - FirstPractice
class FirstPractice: Codable {
    let date, time: String

    init(date: String, time: String) {
        self.date = date
        self.time = time
    }
}
