//
//  ContentView.swift
//  ImageList
//
//  Created by 최준현 on 11/7/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var photoStore = PhotStore()
    @State var currentPage = 1
    @State var isHorizontal: Bool = false
    
    var gridItem = [
        GridItem(),
        GridItem(),
        GridItem()
    ]
    
    private func handlePageChange(id: Int) async {
        if photoStore.shouldLoadData(id: id){
            photoStore.currentPageIncrement()
            Task{
                try await photoStore.photos += photoStore.getImages()
            }
        }
    }
    
    var body: some View {
        NavigationStack{
            ScrollView(isHorizontal ? .horizontal : .vertical){
                if !isHorizontal{
                    LazyVGrid(columns: gridItem, spacing: 8){
                        ForEach(photoStore.photos, id: \.self){ photo in
                            NavigationLink{
                                ListItem(photo: photo)
                            }label: {
                                ImageItem(urlString: photo.src.portrait)
                                    .scrollTransition(axis: .vertical) { content, phase in
                                        return content.offset(x: phase.value * -80, y: phase.value * 80)
                                    }
                                    .frame(width: 150, height: 200)
                            }
                            .task(id: photo.id){
                                await handlePageChange(id: photo.id)
                                
                            }// onAppear
                            
                        }//ForEach
                        .scrollTargetLayout()
                        
                    }//LazyGrid
                }else{
                    LazyHStack{
                        ForEach(photoStore.photos, id: \.self){ photo in
                            NavigationLink{
                                ListItem(photo: photo)
                            }label: {
                                ImageItem(urlString: photo.src.portrait)
                                    .scrollTransition(axis: .horizontal) { content, phase in
                                        content
                                            .blur(radius: phase == .identity ? 0 : 2, opaque: false)
                                            .scaleEffect(phase == .identity ? 0.7 : 0.5, anchor: .center)
                                            .offset(x: phase.value * -80,y: phase == .identity ? 0 : 150)
                                            .rotationEffect(.init(degrees: phase == .identity ? 0 : phase.value * 15), anchor: .center)
                                            
                                    }
                                    .containerRelativeFrame(.horizontal)
                                    
                            }
                            .task(id: photo.id){
                                await handlePageChange(id: photo.id)
                            }// onAppear
                            
                        }//ForEach
                        .scrollTargetLayout()
                    }
                }
            }//scrollView
            .scrollIndicators(.hidden)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isHorizontal.toggle()
                    } label: {
                        isHorizontal
                        ? Image(systemName: "arrow.up.arrow.down.square")
                        : Image(systemName: "arrow.left.arrow.right.square")
                    }
                    .foregroundStyle(.darkBrown)
                    .animation(.bouncy(duration: 0.5), value: isHorizontal)
                    .buttonStyle(.plain)
                }
            }//toolbar
            .toolbarBackground(.lightYellow, for: .navigationBar)
            .background(.lightYellow)
            .navigationTitle("Pexels")
            .navigationBarTitleDisplayMode(.inline)
            
        }// NavigationStack
        .onAppear{
            Task{
                try await photoStore.photos = photoStore.getImages()
            }
        }
    }
}

#Preview {
    ContentView()
}
