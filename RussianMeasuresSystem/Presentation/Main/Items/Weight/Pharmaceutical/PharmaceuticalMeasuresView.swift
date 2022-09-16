//
//  PharmaceuticalMeasuresView.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 10.09.2022.
//

import SwiftUI
import Combine

struct PharmaceuticalMeasuresView: View {
    
    private let subject: PassthroughSubject = PassthroughSubject<PharmaceuticalMeasure, Never>()
    
    @StateObject private var viewModel = PharmaceuticalMeasuresViewModel()
    
    @State private var cancellable: Cancellable? = nil
    
    @AppStorage("SettingsView.isSystemFontAndSize")
    private var isSystemFontAndSize: Bool = true
    
    var body: some View {
        WidthThresholdReader(widthThreshold: 520) { proxy in
            ScrollView(showsIndicators: false) {
                Grid(horizontalSpacing: 12, verticalSpacing: 24) {
                    if proxy.isCompact {
                        gran
                        scruple
                        drachma
                        ounce
                        pound
                        milligram
                        gram
                    } else {
                        GridRow {
                            gran
                            scruple
                        }
                        
                        GridRow {
                            drachma
                            ounce
                        }
                        
                        GridRow {
                            pound
                            milligram
                        }
                        
                        GridRow {
                            gram
                        }
                    }
                }
                .padding()
            }
            .scrollDismissesKeyboard(.immediately)
        }
        .navigationTitle("Аптекарские")
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
    
    var gran: some View {
        VerticallyLabeledTextField(
            label: "Гран",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в гранах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.granText,
            onTextChanged: { value in
                subject.send(PharmaceuticalMeasure(value: value, kind: .gran))
            }
        )
    }
    
    var scruple: some View {
        VerticallyLabeledTextField(
            label: "Скрупул",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в скрупулах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.scrupleText,
            onTextChanged: { value in
                subject.send(PharmaceuticalMeasure(value: value, kind: .scruple))
            }
        )
    }
    
    var drachma: some View {
        VerticallyLabeledTextField(
            label: "Драхма",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в драхмах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.drachmaText,
            onTextChanged: { value in
                subject.send(PharmaceuticalMeasure(value: value, kind: .drachma))
            }
        )
    }
    
    var ounce: some View {
        VerticallyLabeledTextField(
            label: "Унция",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в унциях",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.ounceText,
            onTextChanged: { value in
                subject.send(PharmaceuticalMeasure(value: value, kind: .ounce))
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
                subject.send(PharmaceuticalMeasure(value: value, kind: .pound))
            }
        )
    }
    
    var milligram: some View {
        VerticallyLabeledTextField(
            label: "Миллиграмм",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в миллиграммах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.milligramText,
            onTextChanged: { value in
                subject.send(PharmaceuticalMeasure(value: value, kind: .milligram))
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
                subject.send(PharmaceuticalMeasure(value: value, kind: .gram))
            }
        )
    }
}

struct PharmaceuticalMeasuresView_Previews: PreviewProvider {
    static var previews: some View {
        PharmaceuticalMeasuresView()
    }
}
