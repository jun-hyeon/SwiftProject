//
//  Car.swift
//  TableViewStoryboardEx
//
//  Created by 최준현 on 11/16/23.
//

import Foundation

struct Car: Codable, Identifiable{
    
    var id: String
    var name: String
    
    var description: String
    var isHybrid: Bool
    
    var imageName: String
    
}
