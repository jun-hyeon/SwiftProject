//
//  PhotStore.swift
//  ImageList
//
//  Created by 최준현 on 11/7/23.
//

import Foundation

class PhotStore: ObservableObject {
    @Published var photos = [Photo]()
    private var currentPage = 1
    let apiManager = APIManager.apiManager
    
    
    func shouldLoadData(id: Int) -> Bool{
        return id == photos[photos.count - 10].id
    }
    
    func getImages() async throws  -> [Photo]{
        
        guard let data =  try await apiManager.load(page: currentPage) else{
            return [Photo]()
        }
        
        return data.photos
    }
    
    func currentPageIncrement(){
        currentPage += 1
    }
}
