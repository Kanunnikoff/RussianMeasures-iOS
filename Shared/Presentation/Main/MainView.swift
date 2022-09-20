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
    
    @AppStorage("SettingsView.isPreRevolutionary")
    private var isPreRevolutionary: Bool = false
    
    var body: some View {
        List {
            NavigationLink(value: MeasuresItem.length) {
                Text(isPreRevolutionary ? "Мѣры длины" : "Меры длины")
                    .font(isSystemFontAndSize ? .body : Config.customBodyFont)
            }
            
            NavigationLink(value: MeasuresItem.square) {
                Text(isPreRevolutionary ? "Мѣры площади" : "Меры площади")
                    .font(isSystemFontAndSize ? .body : Config.customBodyFont)
            }
            
            Section {
                NavigationLink(value: MeasuresItem.volume) {
                    Text(isPreRevolutionary ? "Основныя" : "Основные")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
                
                NavigationLink(value: MeasuresItem.bulkSolids) {
                    Text(isPreRevolutionary ? "Сыпучія тѣла (​хлѣбныя​ мѣры)" : "Сыпучие тела (хлебные меры)")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
                
                NavigationLink(value: MeasuresItem.liquidBodies) {
                    Text(isPreRevolutionary ? "Жидкія тѣла («​винныя​ мѣры»)" : "Жидкие тела («винные меры»)")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
            } header: {
                Text(isPreRevolutionary ? "Мѣры объёма" : "Меры объёма")
                    .font(isSystemFontAndSize ? .footnote : Config.customFootnoteFont)
            } footer: {
                Text(isPreRevolutionary ? "Куб. сажень, ​осьмина​, штофъ,.." : "Куб. сажень, осьмина, штоф,..")
                    .font(isSystemFontAndSize ? .footnote : Config.customFootnoteFont)
            }
            
            Section {
                NavigationLink(value: MeasuresItem.weight) {
                    Text(isPreRevolutionary ? "Основныя" : "Основные")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
                
                NavigationLink(value: MeasuresItem.pharmaceutical) {
                    Text(isPreRevolutionary ? "​Аптекарскія​ и ​тройскія​" : "Аптекарские и тройские")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
            } header: {
                Text(isPreRevolutionary ? "Мѣры вѣса" : "Меры веса")
                    .font(isSystemFontAndSize ? .footnote : Config.customFootnoteFont)
            } footer: {
                Text(isPreRevolutionary ? "Пудъ, золотникъ, унція,.." : "Пуд, золотник, унция,..")
                    .font(isSystemFontAndSize ? .footnote : Config.customFootnoteFont)
            }
            
            NavigationLink(value: MeasuresItem.pieceItems) {
                Text(isPreRevolutionary ? "Мѣры поштучныхъ предметовъ" : "Меры поштучных предметов")
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
        .navigationTitle(isPreRevolutionary ? "​Русскія​ мѣры" : Util.getAppDisplayName())
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
