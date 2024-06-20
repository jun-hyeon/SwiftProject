//
//  MVExampleApp.swift
//  MVExample
//
//  Created by 최준현 on 6/19/24.
//

import SwiftUI

@main
struct MVExampleApp: App {
    
    @StateObject private var storeModel = StoreModel(webservice: Webservice())
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(storeModel)
        }
    }
}
