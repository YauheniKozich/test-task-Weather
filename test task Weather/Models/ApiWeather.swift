//
//  ApiWeather.swift
//  test task Weather
//
//  Created by Yauheni Kozich on 13.12.20.
//

import Foundation


struct ApiResponse: Decodable {
    let name: String
    let main: ApiMain
    let weather: [ApiWeather]
}

struct ApiMain: Decodable {
    let temp: Double
    let feels_like: Double
}
struct ApiWeather: Decodable {
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case description
    }
}
