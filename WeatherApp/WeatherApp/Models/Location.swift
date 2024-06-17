//
//  Location.swift
//  WeatherApp
//
//  Created by 최준현 on 6/18/24.
//

import Foundation

struct Location: Decodable {
    let name: String
    let lat: Double
    let lon: Double
}
