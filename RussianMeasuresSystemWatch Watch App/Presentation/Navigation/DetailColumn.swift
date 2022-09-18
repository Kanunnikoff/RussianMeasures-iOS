//
//  DetailColumn.swift
//  RussianMeasuresSystemWatch Watch App
//
//  Created by Дмитрiй Канунниковъ on 18.09.2022.
//

import SwiftUI

struct DetailColumn: View {
    
    let item: SidebarItem?
    
    var body: some View {
        switch item ?? .main {
            case .main:
                MainView()
            case .settings:
                SettingsView()
            case .about:
                AboutView()
        }
    }
}

struct DetailColumn_Previews: PreviewProvider {
    
    struct Preview: View {
        
        var body: some View {
            DetailColumn(item: .main)
        }
    }
    
    static var previews: some View {
        Preview()
    }
}
