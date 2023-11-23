//
//  ListItem.swift
//  ImageList
//
//  Created by 최준현 on 12/4/23.
//

import SwiftUI
import CachedAsyncImage

struct ListItem: View {
    
    var photo: Photo
    
    var body: some View {
        VStack{
            CachedAsyncImage(url: URL(string: photo.src.original)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)

        } placeholder: {
            Image(systemName: "arrow.circlepath")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
        .padding()
            
            Text("Photographer: \(photo.photographer)")
                .font(.headline)
                .padding()
            
            NavigationLink {
                MyWebView(urlToLoad: photo.photographerURL)
            } label: {
                Text("\(photo.photographerURL)")
                    .font(.caption)
            }

            
          
            
           }// VStack
    }
}

//#Preview {
//  
//    ListItem()
//}
