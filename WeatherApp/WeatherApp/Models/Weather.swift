//
//  Weather.swift
//  WeatherApp
//
//  Created by 최준현 on 6/18/24.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
}
