//
//  CarStore.swift
//  TableViewStoryboardEx
//
//  Created by 최준현 on 11/16/23.
//

import Foundation
class CarStore: ObservableObject{
    @Published var cars = [Car]()
    
    init(cars: [Car] = []) {
        self.cars = cars
    }
}
