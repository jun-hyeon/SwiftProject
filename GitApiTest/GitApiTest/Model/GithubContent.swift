//
//  GithubContent.swift
//  GitApiTest
//
//  Created by 최준현 on 10/24/23.
//

import Foundation


import Foundation

// MARK: - GithubContentElement
struct GithubContent: Codable, Identifiable {
    var id: String = UUID().uuidString
    
    let name, path, sha: String
    let size: Int
    let url: String
    let htmlURL: String?
    let gitURL: String?
    let downloadURL: String?
    let type: TypeEnum
    let links: Links

    enum CodingKeys: String, CodingKey {
        case name, path, sha, size, url
        case htmlURL = "html_url"
        case gitURL = "git_url"
        case downloadURL = "download_url"
        case type
        case links = "_links"
    }
}

// MARK: - Links
struct Links: Codable {
    let linksSelf: String
    let git: String?
    let html: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case git, html
    }
}

enum TypeEnum: String, Codable {
    case dir = "dir"
    case file = "file"
}
