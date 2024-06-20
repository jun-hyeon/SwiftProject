//
//  CacheManager.swift
//  ImageList
//
//  Created by 최준현 on 11/4/24.
//

import SwiftUI

class ImageCache {
    static private var cache: [URL: Image] = [:]
    static subscript(url: URL) -> Image?{
        get{
            ImageCache.cache[url]
        }
        set {
            ImageCache.cache[url] = newValue
        }
    }
}

struct CachedAsyncImage<Content>: View where Content: View {
        
    private let url: URL?
    private let scale: CGFloat
    private let transaction: Transaction
    private let content: (AsyncImagePhase) -> Content
    
    init(url: URL?,
         scale: CGFloat = 1.0,
         transaction: Transaction = Transaction(),
         @ViewBuilder content: @escaping (AsyncImagePhase) -> Content) {
        
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }
    
    var body: some View{
        if let url, let cached = ImageCache[url]{
            content(.success(cached))
        }else{
            AsyncImage(url: url,
                       scale:scale,
                       transaction: transaction){ phase in
                cachedAndRender(phase: phase)
            }
        }
    }
    
    func cachedAndRender(phase: AsyncImagePhase) -> some View{
        if case .success(let image) = phase, let url {
            ImageCache[url] = image
        }
        return content(phase)
    }
}
// link: https://www.youtube.com/watch?v=HO1jOqbnkBA
