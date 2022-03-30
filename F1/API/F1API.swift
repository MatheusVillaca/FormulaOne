//
//  F1API.swift
//  Formula1
//
//  Created by Matheus Villaça on 25/03/22.
//

import Foundation

final class F1API {
    
    func getRaces(completion: @escaping ((_ season: SeasonResponse?) -> Void)) {

        guard let urlComponents: URLComponents = URLComponents(string: "http://ergast.com/api/f1/2022.json") else {
            completion (nil)
            return
        }
        guard let url: URL = urlComponents.url else {
            completion (nil)
            return
        }
        let request: URLRequest = .init(url: url)
        RequestManager.request(request, completion: completion)
    }
}
