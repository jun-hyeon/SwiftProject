//
//  ContentView.swift
//  QuickLookDemo
//
//  Created by 최준현 on 1/8/24.
//

import SwiftUI
import QuickLook


struct ContentView: View {
    @State var url: URL?
    var body: some View {
        NavigationStack{
            VStack{
                // UIKit AR QuickLook
                NavigationLink(destination: QuickLookView()){
                    Text("UIKit QuickLook")
                }
                .padding()
                
                // SwiftUI AR QuickLook oh.. my time...
                Button("SwiftUI QuickLook"){
                    url = Bundle.main.url(forResource: "slide", withExtension: "usdz")
//                    url = URL(string: "https://developer.apple.com/augmented-reality/quick-look/models/hab/hab_en.reality")
                }
                .padding()
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .quickLookPreview($url)
    }
}

struct QuickLookView: UIViewControllerRepresentable{
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    
    typealias UIViewControllerType = ARViewController
    
    func makeUIViewController(context: Context) -> ARViewController {
        let viewController = ARViewController()
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: ARViewController, context: Context) {
        
    }
    
    class Coordinator: NSObject{
        var parent: QuickLookView
        init(_ parent: QuickLookView){
            self.parent = parent
        }
    }
}

#Preview {
    ContentView()
}
