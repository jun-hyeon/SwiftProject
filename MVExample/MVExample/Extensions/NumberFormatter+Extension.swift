//
//  NumberFormatter+Extension.swift
//  MVExample
//
//  Created by 최준현 on 6/19/24.
//

import Foundation

extension NumberFormatter{
    static var currency: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
