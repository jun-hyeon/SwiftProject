//
//  ListItem.swift
//  ImageList
//
//  Created by 최준현 on 12/4/23.
//

import SwiftUI


struct ListItem: View {
    
    var photo: Photo
    
    var body: some View {
        ZStack{
            
            Color.lightYellow
                .ignoresSafeArea(.all)
            
            VStack{
                // before
                //      AsyncImage(url: URL(string: photo.src.original)) { image in
                //            image
                //                .resizable()
                //                .aspectRatio(contentMode: .fit)
                //
                //        } placeholder: {
                //            Image(systemName: "arrow.circlepath")
                //                .resizable()
                //                .aspectRatio(contentMode: .fit)
                //        }
                
                // after cache
                CachedAsyncImage(url: URL(string: photo.src.original)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    case .empty:
                        ProgressView()
                    case .failure(let error):
                        Text("\(error.localizedDescription)")
                    @unknown default:
                        fatalError()
                    }
                }
                .border(Color.darkBrown, width: 1.0)
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
            
        }//ZStack
        
    }
}

//#Preview {
//
//}
