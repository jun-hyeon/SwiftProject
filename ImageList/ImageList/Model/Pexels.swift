//
//  Pexels.swift
//  ImageList
//
//  Created by 최준현 on 11/7/23.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let pexels = try? JSONDecoder().decode(Pexels.self, from: jsonData)


// MARK: - Pexels
struct Pexels: Codable{
    let page, perPage: Int
    let photos: [Photo]
    let totalResults: Int
    let nextPage, prevPage: String?

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case photos
        case totalResults = "total_results"
        case nextPage = "next_page"
        case prevPage = "prev_page"
    }
}

// MARK: - Photo
struct Photo: Codable, Hashable{
    
    let id, width, height: Int
    let url: String
    let photographer: String
    let photographerURL: String
    let photographerID: Int
    let avgColor: String
    let src: Src
    let liked: Bool
    let alt: String

    enum CodingKeys: String, CodingKey {
        case id, width, height, url, photographer
        case photographerURL = "photographer_url"
        case photographerID = "photographer_id"
        case avgColor = "avg_color"
        case src, liked, alt
    }
}

//extension Photo: Equatable{
//  static func == (lhs: Photo, rhs: Photo) -> Bool{
//        let areEqual = lhs.id == rhs.id && lhs.url == rhs.url
//        return areEqual
//    }
//}

// MARK: - Src
struct Src: Codable, Hashable{
    let original, large2X, large, medium: String
    let small, portrait, landscape, tiny: String

    enum CodingKeys: String, CodingKey {
        case original
        case large2X = "large2x"
        case large, medium, small, portrait, landscape, tiny
    }
}
