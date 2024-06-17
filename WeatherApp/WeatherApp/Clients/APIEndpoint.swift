//
//  APIEndpoint.swift
//  WeatherApp
//
//  Created by 최준현 on 6/18/24.
//

import Foundation

enum APIEndpoint{
    
    static let baseURL = "https://api.openweathermap.org"
    
    case coordinatesBylocationName(String)
    case weatherByLatLon(Double, Double)
    
    
    
    private var path: String{
        switch self{
        case .coordinatesBylocationName(let city):
            print("key",Bundle.main.apiKey)
            return "/geo/1.0/direct?q=\(city)&appid=\(Bundle.main.apiKey ?? "")"
        case .weatherByLatLon(let lat, let lon):
            print(Bundle.main.apiKey)
            return "/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(Bundle.main.apiKey ?? "")"
        }
    }
    
    static func endPointURL(for endpoint: APIEndpoint) -> URL{
        let endpointPath = endpoint.path
        return URL(string: baseURL + endpointPath)!
    }
}
