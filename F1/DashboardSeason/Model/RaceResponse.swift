//
//  RaceResponse.swift
//  Formula1
//
//  Created by Matheus Villaça on 25/03/22.
//

import Foundation

class RaceResponse: Codable {
    let MRDate: RaceTable
}

class RaceTable: Codable {
    let RaceTable: RaceInfo
}

final class RaceInfo: Codable {
    let Races: [Race]
    
}
