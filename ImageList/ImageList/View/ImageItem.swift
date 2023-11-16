//
//  ImageItem.swift
//  ImageList
//
//  Created by 최준현 on 11/8/23.
//

import SwiftUI

struct ImageItem: View {
    var urlString: String
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
            
        } placeholder: {
            Image(systemName: "arrow.circlepath")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .frame(width: 200, height: 150)

    }
}

#Preview {
    ImageItem(urlString: "https://images.pexels.com/photos/18920807/pexels-photo-18920807.jpeg?auto=compress&cs=tinysrgb&h=650&w=940")
}
