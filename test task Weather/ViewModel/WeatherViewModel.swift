//
//  WeatherViewModel.swift
//  test task Weather
//
//  Created by Yauheni Kozich on 12.12.20.
//

import Foundation

public class WeatherViewModel: ObservableObject {
    
   // let defautIcon = "👻"

    @Published var city: String = "City name"
    @Published var temperature: String = "- -"
    @Published var description: String = ""
    @Published var feels_like: String = ""
    
    public let weatherSevice: WeatherService
    
    
    init(weatherSevice: WeatherService) {
        self.weatherSevice = weatherSevice
    }
    
    public func refrech() {
        weatherSevice.loadWeatherData { weather in
            DispatchQueue.main.async { [self] in
                city = weather.city
                temperature = weather.temperature
                description = weather.description.capitalized
                feels_like = weather.feels_like
            }
        }
    }
}
