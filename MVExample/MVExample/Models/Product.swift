//
//  Product.swift
//  MVExample
//
//  Created by 최준현 on 6/19/24.
//

import Foundation
struct Product: Decodable, Identifiable{
    
    let id: Int
    let title: String
    let price: Double
    
}
