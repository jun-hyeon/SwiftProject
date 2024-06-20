//
//  ProductListViewModel.swift
//  MVVMExample
//
//  Created by 최준현 on 6/19/24.
//

import Foundation

@MainActor
class ProductListViewModel: ObservableObject{
    
    @Published var products: [ProductViewModel] = []
    
    let webService: WebService
    
    init(webservice: WebService){
        self.webService = webservice
    }
    
    func populateProducts() async {
        do{
            let products = try await webService.getProducts()
            self.products = products.map(ProductViewModel.init)
            
        }catch{
            print(error)
        }
    }
}


struct ProductViewModel: Identifiable{
    private var product: Product
    
    init(product:Product){
        self.product = product
    }
    
    var id: Int{
        product.id
    }
    
    var title: String{
        product.title
    }
    
    var price: Double{
        product.price
    }
}
