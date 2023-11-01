//
//  ContentView.swift
//  GitApiTest
//
//  Created by 최준현 on 10/24/23.
//

import SwiftUI


    
struct ContentView: View {
    @StateObject var store = Store()
    var body: some View {
        Text("Hello")
        List(store.gitContents){ contents in
            VStack(alignment: .leading){
                Text("name: \(contents.name)")
                
                Text("url: \(contents.gitURL ?? "no url sorry..")")
                    .lineLimit(1)
            }
        }.onAppear{
            if store.gitContents.isEmpty{
                Task{
                    try await store.fetchData()
                }
            }
        }
    }
}



#Preview {
    ContentView()
}
