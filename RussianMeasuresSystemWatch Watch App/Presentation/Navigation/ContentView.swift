//
//  ContentView.swift
//  RussianMeasuresSystemWatch Watch App
//
//  Created by Дмитрiй Канунниковъ on 18.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var path: NavigationPath = NavigationPath([SidebarItem.main])
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                NavigationLink(value: SidebarItem.main) {
                    Label("Главная", systemImage: "house")
                }

                NavigationLink(value: SidebarItem.settings) {
                    Label("Настройки", systemImage: "gear")
                }

                NavigationLink(value: SidebarItem.about) {
                    Label("О программе", systemImage: "info.circle")
                }
            }
            .navigationDestination(for: SidebarItem.self) { item in
                DetailColumn(item: item)
            }
            .navigationTitle("Меню")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
