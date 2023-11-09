//
//  PhotStore.swift
//  ImageList
//
//  Created by 최준현 on 11/7/23.
//

import Foundation

class PhotStore: ObservableObject {
    @Published var photos = [Photo]()
    
    
    
    func shouldLoadData(id: Int) -> Bool{
        return id == photos[photos.count - 10].id
    }
    
    func getImages(page: Int) async throws  -> [Photo]{
        
        guard let data =  try await APIManager().load(page: page) else{
            return [Photo]()
        }
        
        return data.photos
    }
}
