//
//  RussianMeasuresSystemApp.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 06.08.2022.
//

import SwiftUI

@main
struct RussianMeasuresSystemApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
#if os(macOS)
        .defaultSize(width: 1000, height: 650)
#endif
    }
}
