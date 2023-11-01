//
//  GitContentViewModel.swift
//  GitApiTest
//
//  Created by 최준현 on 10/25/23.
//

import Foundation
class Store: ObservableObject{
    @Published var gitContents = [GithubContent]()
    
    func fetchData() async throws {
        guard let downloadedPosts: [GithubContent] = try await Network().getContent(
            fromUrl: "https://api.github.com/repos/jun-hyeon/baekjoon/contents")
        else {fatalError()}
        gitContents = downloadedPosts
    }
    
}
