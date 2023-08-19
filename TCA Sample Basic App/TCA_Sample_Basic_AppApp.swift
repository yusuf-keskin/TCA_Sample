//
//  TCA_Sample_Basic_AppApp.swift
//  TCA Sample Basic App
//
//  Created by YUSUF KESKİN on 15.08.2023.
//

import SwiftUI

@main
struct TCA_Sample_Basic_AppApp: App {
    var body: some Scene {
        
        let store = Store<AppState>(reducer: appReducer, state: AppState())
        
        WindowGroup {
            ContentView().environmentObject(store)        }
    }
}
