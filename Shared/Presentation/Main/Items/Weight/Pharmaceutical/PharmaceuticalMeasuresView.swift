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
    
    @AppStorage("SettingsView.isPreRevolutionary")
    private var isPreRevolutionary: Bool = false
    
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
        .navigationTitle(isPreRevolutionary ? "Аптекарскія" : "Аптекарские")
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
            label: isPreRevolutionary ? "Гранъ" : "Гран",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ ​гранахъ" : "Введите значение в гранах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.granText,
            onTextChanged: { value in
                subject.send(PharmaceuticalMeasure(value: value, kind: .gran))
            }
        )
    }
    
    var scruple: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Скрупулъ" : "Скрупул",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ ​скрупулахъ" : "Введите значение в скрупулах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.scrupleText,
            onTextChanged: { value in
                subject.send(PharmaceuticalMeasure(value: value, kind: .scruple))
            }
        )
    }
    
    var drachma: some View {
        VerticallyLabeledTextField(
            label: "Драхма",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ драхмахъ" : "Введите значение в драхмах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.drachmaText,
            onTextChanged: { value in
                subject.send(PharmaceuticalMeasure(value: value, kind: .drachma))
            }
        )
    }
    
    var ounce: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Унція" : "Унция",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ унціяхъ" : "Введите значение в унциях",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.ounceText,
            onTextChanged: { value in
                subject.send(PharmaceuticalMeasure(value: value, kind: .ounce))
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
                subject.send(PharmaceuticalMeasure(value: value, kind: .pound))
            }
        )
    }
    
    var milligram: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Миллиграммъ" : "Миллиграмм",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ миллиграммахъ" : "Введите значение в миллиграммах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.milligramText,
            onTextChanged: { value in
                subject.send(PharmaceuticalMeasure(value: value, kind: .milligram))
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
