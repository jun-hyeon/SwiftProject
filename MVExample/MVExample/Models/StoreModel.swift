//
//  StoreModel.swift
//  MVExample
//
//  Created by 최준현 on 6/19/24.
//

import Foundation

@MainActor
class StoreModel: ObservableObject{
    
    let webservice: Webservice
    @Published var products: [Product] = []
    
    init(webservice: Webservice){
        self.webservice = webservice
    }
    
    func populateProducts() async throws{
        
        products = try await webservice.getProducts()
    }
}
