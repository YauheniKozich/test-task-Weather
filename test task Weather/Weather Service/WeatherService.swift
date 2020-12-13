//
//  WeatherService.swift
//  test task Weather
//
//  Created by Yauheni Kozich on 11.12.20.
//


import Foundation
import CoreLocation


public final class WeatherService: NSObject {
    private var locationManager = CLLocationManager()
    var apiKey = "4838e8b1cd6500f38d7abead8baa67d6"
    private var completionHendler: ((Weather) -> Void)?
    
    override init() {
        super.init()
        locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    public func loadWeatherData(completion: @escaping((Weather) -> Void)) {
        self.completionHendler = completion
    }
    // http://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    
    private func makeDataRequest(forCoordinate coordinate: CLLocationCoordinate2D) {
       let urlString =
                "http://api.openweathermap.org/data/2.5/weather?lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data ,_, error in
            guard let data = data, error == nil else {return}
            let response = try? JSONDecoder().decode(ApiResponse.self, from: data)
            if let responseWeather = response {
                self.completionHendler?(Weather(response: responseWeather))
            }
            
        }.resume()
    }
    
}

extension WeatherService: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {return}
        makeDataRequest(forCoordinate: location.coordinate)
    }
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
