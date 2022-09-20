//
//  Sidebar.swift
//  Glagolitsa
//
//  Created by Дмитрiй Канунниковъ on 11.07.2022.
//

import SwiftUI

struct Sidebar: View {

    @Binding var selection: SidebarItem?
    
    @AppStorage("SettingsView.isPreRevolutionary")
    private var isPreRevolutionary: Bool = false
    
    var body: some View {
        List(selection: $selection) {
            NavigationLink(value: SidebarItem.main) {
                Label("Главная", systemImage: "house")
            }
            
            NavigationLink(value: SidebarItem.settings) {
                Label("Настройки", systemImage: "gear")
            }
            
            NavigationLink(value: SidebarItem.about) {
                Label(isPreRevolutionary ? "О программѣ" : "О программе", systemImage: "info.circle")
            }
        }
        .navigationTitle("Меню")
#if os(macOS)
        .navigationSplitViewColumnWidth(min: 200, ideal: 200)
#endif
    }
}

struct Sidebar_Previews: PreviewProvider {
    struct Preview: View {
        @State private var selection: SidebarItem? = SidebarItem.main
        var body: some View {
            Sidebar(selection: $selection)
        }
    }
    
    static var previews: some View {
        NavigationSplitView {
            Preview()
        } detail: {
            Text("Detail!")
        }
    }
}
