//
//  ContentView.swift
//  ImageList
//
//  Created by 최준현 on 11/7/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var photoStore = PhotStore()
    @State var currentPage = 1
    
    
    var gridItem = [
        GridItem(),
        GridItem(),
        GridItem()
        ]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: gridItem, spacing: 5){
                    ForEach(photoStore.photos, id:  \.self){ photo in
                        ImageItem(urlString: photo.src.portrait)
                            .onAppear{
                                if photoStore.shouldLoadData(id: photo.id){
                                    print("true")
                                    currentPage += 1
                                    Task{
                                        try await photoStore.photos += photoStore.getImages(page: currentPage)
                                    }
                                }
                            }
                    }//ForEach
                    
                }//LazyGrid
                
            }//scrollView
            .padding()
            
        }// NavigationStack
        .onAppear{
            Task{
                try await photoStore.photos = photoStore.getImages(page: 1)
            }
        }
    }
}

#Preview {
    ContentView()
}
