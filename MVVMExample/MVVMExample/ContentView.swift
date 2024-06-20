//
//  ContentView.swift
//  MVVMExample
//
//  Created by 최준현 on 6/19/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = ProductListViewModel(webservice: WebService())
    
    var body: some View {
        VStack {
            List(vm.products){ product in
                Text(product.title)
            }.task{
                await vm.populateProducts()
            }
        }
    }
}

#Preview {
    ContentView()
}
