//
//  MeasurementFormatter+Extensions.swift
//  WeatherApp
//
//  Created by 최준현 on 6/18/24.
//

import Foundation

extension MeasurementFormatter{
    
    static func temperature(value: Double) -> String{
        
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        
        let formatter = MeasurementFormatter()
        formatter.numberFormatter = numberFormatter
        
        let temp = Measurement(value: value, unit: UnitTemperature.kelvin)
        
        return formatter.string(from: temp)
    }
    
}

extension Bundle{
    var apiKey: String{
        guard let key = infoDictionary?["API_KEY"] as? String else {return "NO KEY"}
        return key
    }
}
