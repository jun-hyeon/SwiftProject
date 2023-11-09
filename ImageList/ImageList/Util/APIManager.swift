//
//  APIManager.swift
//  ImageList
//
//  Created by 최준현 on 11/7/23.
//

import Foundation

extension Bundle{

    func parsePlist() -> [String : AnyObject] {
        
        guard let plistUrl = Bundle.main.url(forResource: "Info", withExtension: "plist") else{
            fatalError("Couldn't find file 'Info.plist")
        }
        
        guard let plistData = try? Data(contentsOf: plistUrl),
              let dict = try? PropertyListSerialization.propertyList(from: plistData, format: nil) as? [String: AnyObject] else{
            fatalError("Couldn't load dictionary from data.")
        }
        
        return dict
    }
}



enum NetworkError: Error {
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case failedToDecodeResponse
}

class APIManager{
    
    static let apiManager = APIManager()
    
    func load(page: Int) async throws -> Pexels?{
        
        do{
            guard let url = URL(string: "https://api.pexels.com/v1/curated/?page=\(page)&per_page=80") else{
                throw NetworkError.badUrl
            }
            
            
            let plistDict = Bundle.main.parsePlist()
            guard let api_key = plistDict["API_KEY"] as? String else{
                fatalError("No API KEY")
            }
            
            var urlRequest = URLRequest(url: url)
            urlRequest.setValue(api_key, forHTTPHeaderField: "Authorization")
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            
            guard(response as? HTTPURLResponse)?.statusCode == 200 else {throw NetworkError.badResponse}
            
            guard let decodedContent = try? JSONDecoder().decode(Pexels.self, from: data) else{
                throw NetworkError.failedToDecodeResponse
                
            }
            
//            print("decoded Content: \(decodedContent)")
            
            return decodedContent
            
        }catch{
            switch error{
            case NetworkError.badUrl:
                print("bad URL")
            case NetworkError.badResponse:
                print("bad Response")
            case NetworkError.badStatus:
                print("bad Status")
            case NetworkError.failedToDecodeResponse:
                print("Failed to decode")
            default:
                print("error")
            }
            return nil
        }
    }
    
}
