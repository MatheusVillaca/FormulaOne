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
    var round: String
    let circuit: Circuit
    
    private enum CodingKeys: String, CodingKey {
        case name = "raceName"
        case circuit = "Circuit"
        case date, round
    }
    
    init(name: String, date: String, circuitImage: String, round: String, circuit: Circuit) {
        self.name = name
        self.date = date
        self.circuit = circuit
        self.round = round
    }
}

class Circuit: Codable {
    
    enum ID: String, Codable {
        case bahrain, jeddah, albertPark = "albert_park", imola, miami, catalunya, monaco, BAK, villeneuve, silverstone, redBullRing = "red_bull_ring", ricard, hungaroring, spa, zandvoort, monza, marinaBay = "marina_bay", suzuka, americas, rodriguez, interlagos, yasMarina = "yas_marina"
    }
    
    let id: ID
    var imageURL: URL? {
        switch id {
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
        case .BAK:
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
    
    private enum CodingKeys: String, CodingKey {
        case id = "circuitId"
    }
}
