//
//  GeocodingClient.swift
//  WeatherApp
//
//  Created by 최준현 on 6/18/24.
//

import Foundation

enum NetworkError: Error{
    case invalidResponse
}

struct GeocodingClient{
    func coordinateByCity(_ city: String) async throws -> Location?{
        
        let (data, response) = try await URLSession.shared.data(from: APIEndpoint.endPointURL(for: .coordinatesBylocationName(city)))
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else{
            throw NetworkError.invalidResponse
        }
        
        let location = try JSONDecoder().decode([Location].self, from: data)
        return location.first
    }
}
