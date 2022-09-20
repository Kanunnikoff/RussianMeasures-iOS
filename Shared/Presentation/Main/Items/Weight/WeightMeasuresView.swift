//
//  WeightMeasuresView.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 04.09.2022.
//

import SwiftUI
import Combine

struct WeightMeasuresView: View {
    
    private let subject: PassthroughSubject = PassthroughSubject<WeightMeasure, Never>()
    
    @StateObject private var viewModel = WeightMeasuresViewModel()
    
    @State private var cancellable: Cancellable? = nil
    
    @AppStorage("SettingsView.isSystemFontAndSize")
    private var isSystemFontAndSize: Bool = true
    
    @AppStorage("SettingsView.isPreRevolutionary")
    private var isPreRevolutionary: Bool = false
    
    var body: some View {
        WidthThresholdReader(widthThreshold: 520) { proxy in
            ScrollView(showsIndicators: false) {
                Grid(horizontalSpacing: 12, verticalSpacing: 24) {
                    if proxy.isCompact {
                        share
                        bud
                        spool
                        lot
                        pound
                        pud
                        berkovets
                        gram
                        kilogram
                    } else {
                        GridRow {
                            share
                            bud
                        }
                        
                        GridRow {
                            spool
                            lot
                        }
                        
                        GridRow {
                            pound
                            pud
                        }
                        
                        GridRow {
                            berkovets
                            gram
                        }
                        
                        GridRow {
                            kilogram
                        }
                    }
                }
                .padding()
            }
            .scrollDismissesKeyboard(.immediately)
        }
        .navigationTitle(isPreRevolutionary ? "Мѣры вѣса" : "Меры веса")
        .onAppear {
            cancellable = subject
                .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
                .sink { measure in
                    viewModel.convert(measure: measure)
                }
        }
        .onDisappear {
            cancellable?.cancel()
        }
    }
    
    var share: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Доля (пирогъ)" : "Доля (пирог)",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ доляхъ" : "Введите значение в долях",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.shareText,
            onTextChanged: { value in
                subject.send(WeightMeasure(value: value, kind: .share))
            }
        )
    }
    
    var bud: some View {
        VerticallyLabeledTextField(
            label: "Почка",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ почкахъ" : "Введите значение в почках",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.budText,
            onTextChanged: { value in
                subject.send(WeightMeasure(value: value, kind: .bud))
            }
        )
    }
    
    var spool: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Золотникъ" : "Золотник",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ золотникахъ" : "Введите значение в золотниках",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.spoolText,
            onTextChanged: { value in
                subject.send(WeightMeasure(value: value, kind: .spool))
            }
        )
    }
    
    var lot: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Лотъ" : "Лот",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ лотахъ" : "Введите значение в лотах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.lotText,
            onTextChanged: { value in
                subject.send(WeightMeasure(value: value, kind: .lot))
            }
        )
    }
    
    var pound: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Фунтъ" : "Фунт",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ фунтахъ" : "Введите значение в фунтах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.poundText,
            onTextChanged: { value in
                subject.send(WeightMeasure(value: value, kind: .pound))
            }
        )
    }
    
    var pud: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Пудъ" : "Пуд",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ пудахъ" : "Введите значение в пудах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.pudText,
            onTextChanged: { value in
                subject.send(WeightMeasure(value: value, kind: .pud))
            }
        )
    }
    
    var berkovets: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Берковецъ" : "Берковец",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ ​берковцахъ" : "Введите значение в берковцах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.berkovetsText,
            onTextChanged: { value in
                subject.send(WeightMeasure(value: value, kind: .berkovets))
            }
        )
    }
    
    var gram: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Граммъ" : "Грамм",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ граммахъ" : "Введите значение в граммах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.gramText,
            onTextChanged: { value in
                subject.send(WeightMeasure(value: value, kind: .gram))
            }
        )
    }
    
    var kilogram: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Килограммъ" : "Килограмм",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ килограммахъ" : "Введите значение в килограммах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.kilogramText,
            onTextChanged: { value in
                subject.send(WeightMeasure(value: value, kind: .kilogram))
            }
        )
    }
}

struct WeightMeasuresView_Previews: PreviewProvider {
    static var previews: some View {
        WeightMeasuresView()
    }
}
