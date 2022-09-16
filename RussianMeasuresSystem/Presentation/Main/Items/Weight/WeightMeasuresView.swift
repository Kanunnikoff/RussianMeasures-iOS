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
        .navigationTitle("Меры веса")
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
            label: "Доля (пирог)",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в долях",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.shareText,
            onTextChanged: { value in
                subject.send(WeightMeasure(value: value, kind: .share))
            }
        )
    }
    
    var bud: some View {
        VerticallyLabeledTextField(
            label: "Почка",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в почках",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.budText,
            onTextChanged: { value in
                subject.send(WeightMeasure(value: value, kind: .bud))
            }
        )
    }
    
    var spool: some View {
        VerticallyLabeledTextField(
            label: "Золотник",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в золотник",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.spoolText,
            onTextChanged: { value in
                subject.send(WeightMeasure(value: value, kind: .spool))
            }
        )
    }
    
    var lot: some View {
        VerticallyLabeledTextField(
            label: "Лот",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в лотах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.lotText,
            onTextChanged: { value in
                subject.send(WeightMeasure(value: value, kind: .lot))
            }
        )
    }
    
    var pound: some View {
        VerticallyLabeledTextField(
            label: "Фунт",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в фунтах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.poundText,
            onTextChanged: { value in
                subject.send(WeightMeasure(value: value, kind: .pound))
            }
        )
    }
    
    var pud: some View {
        VerticallyLabeledTextField(
            label: "Пуд",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в пудах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.pudText,
            onTextChanged: { value in
                subject.send(WeightMeasure(value: value, kind: .pud))
            }
        )
    }
    
    var berkovets: some View {
        VerticallyLabeledTextField(
            label: "Берковец",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в берковцах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.berkovetsText,
            onTextChanged: { value in
                subject.send(WeightMeasure(value: value, kind: .berkovets))
            }
        )
    }
    
    var gram: some View {
        VerticallyLabeledTextField(
            label: "Грамм",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в граммах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.gramText,
            onTextChanged: { value in
                subject.send(WeightMeasure(value: value, kind: .gram))
            }
        )
    }
    
    var kilogram: some View {
        VerticallyLabeledTextField(
            label: "Килограмм",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в килограммах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
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
