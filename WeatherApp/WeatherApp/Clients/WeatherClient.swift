//
//  WeatherClient.swift
//  WeatherApp
//
//  Created by 최준현 on 6/18/24.
//

import Foundation

struct WeatherClient{
    func fetchWeather(location: Location) async throws -> Weather{
        let (data, response) = try await URLSession.shared.data(from: APIEndpoint.endPointURL(for: .weatherByLatLon(location.lat, location.lon)))
        
        guard let httpResposne = response as? HTTPURLResponse, httpResposne.statusCode == 200 else{
            throw NetworkError.invalidResponse
        }
        
        let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return weatherResponse.main
    }
}
