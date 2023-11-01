//
//  Network.swift
//  GitApiTest
//
//  Created by 최준현 on 10/24/23.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case failedToDecodeResponse
}

class Network{
     
    func getContent(fromUrl: String) async throws -> [GithubContent]?{
        do{
            guard let url = URL(string: fromUrl)
            else{ throw NetworkError.badUrl }
            
            let urlRequest = URLRequest(url: url)
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
                
            guard(response as? HTTPURLResponse)?.statusCode == 200 else{throw NetworkError.badResponse}
            
                
            guard let decodedContent = try? JSONDecoder().decode([GithubContent].self, from: data) else{throw NetworkError.failedToDecodeResponse}
                        
            print("Completion handler decodedFood", decodedContent)

            return decodedContent
            
        } catch NetworkError.badUrl {
            print("There was an error creating the URL")
        } catch NetworkError.badResponse {
            print("Did not get a valid response")
        } catch NetworkError.badStatus {
            print("Did not get a 2xx status code from the response")
        } catch NetworkError.failedToDecodeResponse {
            print("Failed to decode response into the given type")
        } catch {
            print("An error occured downloading the data")
        }
        return nil
    }
}

