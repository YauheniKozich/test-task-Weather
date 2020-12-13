//
//  Weather.swift
//  test task Weather
//
//  Created by Yauheni Kozich on 11.12.20.
//

import Foundation

public struct Weather {
    let city: String
    let temperature: String
    let description: String
    let feels_like: String
    
    init(response: ApiResponse) {
        city = response.name
        temperature = "\(Int(response.main.temp))"
        description = response.weather.first?.description ?? ""
        feels_like = "\(Int(response.main.feels_like))"
    }
}
