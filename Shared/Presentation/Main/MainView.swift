//
//  MainView.swift
//  Glagolitsa
//
//  Created by Дмитрiй Канунниковъ on 12.07.2022.
//

import SwiftUI
import Combine

struct MainView: View {
    
    @State private var cancellable: Cancellable? = nil
    
    @AppStorage("SettingsView.isSystemFontAndSize")
    private var isSystemFontAndSize: Bool = true
    
    var body: some View {
        List {
            NavigationLink(value: MeasuresItem.length) {
                Text("Меры длины")
                    .font(isSystemFontAndSize ? .body : Config.customBodyFont)
            }
            
            NavigationLink(value: MeasuresItem.square) {
                Text("Меры площади")
                    .font(isSystemFontAndSize ? .body : Config.customBodyFont)
            }
            
            Section {
                NavigationLink(value: MeasuresItem.volume) {
                    Text("Основные")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
                
                NavigationLink(value: MeasuresItem.bulkSolids) {
                    Text("Сыпучие тела (хлебные меры)")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
                
                NavigationLink(value: MeasuresItem.liquidBodies) {
                    Text("Жидкие тела («винные меры»)")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
            } header: {
                Text("Меры объёма")
                    .font(isSystemFontAndSize ? .footnote : Config.customFootnoteFont)
            } footer: {
                Text("Куб. сажень, осьмина, штоф,..")
                    .font(isSystemFontAndSize ? .footnote : Config.customFootnoteFont)
            }
            
            Section {
                NavigationLink(value: MeasuresItem.weight) {
                    Text("Основные")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
                
                NavigationLink(value: MeasuresItem.pharmaceutical) {
                    Text("Аптекарские и тройские")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
            } header: {
                Text("Меры веса")
                    .font(isSystemFontAndSize ? .footnote : Config.customFootnoteFont)
            } footer: {
                Text("Пуд, золотник, унция,..")
                    .font(isSystemFontAndSize ? .footnote : Config.customFootnoteFont)
            }
            
            NavigationLink(value: MeasuresItem.pieceItems) {
                Text("Меры поштучных предметов")
                    .font(isSystemFontAndSize ? .body : Config.customBodyFont)
            }
        }
        .navigationDestination(for: MeasuresItem.self) { item in
            MeasuresItemDetails(item: item)
        }
#if os(iOS)
        .listStyle(.insetGrouped)
#elseif !os(tvOS) && !os(watchOS)
        .listStyle(.bordered)
#endif
        .navigationTitle(Util.getAppDisplayName())
    }
}

struct MainView_Previews: PreviewProvider {
    
    struct Preview: View {
        
        var body: some View {
            MainView()
        }
    }
    
    static var previews: some View {
        NavigationStack {
            Preview()
        }
    }
}
