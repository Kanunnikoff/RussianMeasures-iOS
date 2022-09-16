//
//  SquareMeasuresView.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 28.08.2022.
//

import SwiftUI
import Combine

struct SquareMeasuresView: View {
    
    private let subject: PassthroughSubject = PassthroughSubject<SquareMeasure, Never>()
    
    @StateObject private var viewModel = SquareMeasuresViewModel()
    
    @State private var cancellable: Cancellable? = nil
    
    @AppStorage("SettingsView.isSystemFontAndSize")
    private var isSystemFontAndSize: Bool = true
    
    var body: some View {
        WidthThresholdReader(widthThreshold: 520) { proxy in
            ScrollView(showsIndicators: false) {
                Grid(horizontalSpacing: 12, verticalSpacing: 24) {
                    if proxy.isCompact {
                        line
                        inch
                        vershok
                        foot
                        arshin
                        fathom
                        
                        VStack(spacing: 24) {
                            osminnik
                            chet
                            dessiatin
                            verst
                            millimeter
                            centimeter
                            meter
                            hectare
                        }
                    } else {
                        GridRow {
                            line
                            inch
                        }
                        
                        GridRow {
                            vershok
                            foot
                        }
                        
                        GridRow {
                            arshin
                            fathom
                        }
                        
                        GridRow {
                            osminnik
                            chet
                        }
                        
                        GridRow {
                            dessiatin
                            verst
                        }
                        
                        GridRow {
                            millimeter
                            centimeter
                        }
                        
                        GridRow {
                            meter
                            hectare
                        }
                    }
                }
                .padding()
            }
            .scrollDismissesKeyboard(.immediately)
        }
        .navigationTitle("Меры площади")
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
    
    var line: some View {
        VerticallyLabeledTextField(
            label: "Кв. линия",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в кв. линиях",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.lineText,
            onTextChanged: { value in
                subject.send(SquareMeasure(value: value, kind: .line))
            }
        )
    }
    
    var inch: some View {
        VerticallyLabeledTextField(
            label: "Кв. дюйм",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в кв. дюймах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.inchText,
            onTextChanged: { value in
                subject.send(SquareMeasure(value: value, kind: .inch))
            }
        )
    }
    
    var vershok: some View {
        VerticallyLabeledTextField(
            label: "Кв. вершок",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в кв. вершках",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.vershokText,
            onTextChanged: { value in
                subject.send(SquareMeasure(value: value, kind: .vershok))
            }
        )
    }
    
    var foot: some View {
        VerticallyLabeledTextField(
            label: "Кв. фут",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в кв. футах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.footText,
            onTextChanged: { value in
                subject.send(SquareMeasure(value: value, kind: .foot))
            }
        )
    }
    
    var arshin: some View {
        VerticallyLabeledTextField(
            label: "Кв. аршин",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в кв. аршинах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.arshinText,
            onTextChanged: { value in
                subject.send(SquareMeasure(value: value, kind: .arshin))
            }
        )
    }
    
    var fathom: some View {
        VerticallyLabeledTextField(
            label: "Кв. сажень",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в кв. саженях",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.fathomText,
            onTextChanged: { value in
                subject.send(SquareMeasure(value: value, kind: .fathom))
            }
        )
    }
    
    var osminnik: some View {
        VerticallyLabeledTextField(
            label: "Осминник",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в осминниках",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.osminnikText,
            onTextChanged: { value in
                subject.send(SquareMeasure(value: value, kind: .osminnik))
            }
        )
    }
    
    var chet: some View {
        VerticallyLabeledTextField(
            label: "Четь",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в четях",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.chetText,
            onTextChanged: { value in
                subject.send(SquareMeasure(value: value, kind: .chet))
            }
        )
    }
    
    var dessiatin: some View {
        VerticallyLabeledTextField(
            label: "Десятина",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в десятинах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.dessiatinText,
            onTextChanged: { value in
                subject.send(SquareMeasure(value: value, kind: .dessiatin))
            }
        )
    }
    
    var verst: some View {
        VerticallyLabeledTextField(
            label: "Кв. верста",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в кв. вёрстах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.verstText,
            onTextChanged: { value in
                subject.send(SquareMeasure(value: value, kind: .verst))
            }
        )
    }
    
    var millimeter: some View {
        VerticallyLabeledTextField(
            label: "Кв. миллиметр",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в кв. миллиметрах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.millimeterText,
            onTextChanged: { value in
                subject.send(SquareMeasure(value: value, kind: .millimeter))
            }
        )
    }
    
    var centimeter: some View {
        VerticallyLabeledTextField(
            label: "Кв. сантиметр",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в кв. сантиметрах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.centimeterText,
            onTextChanged: { value in
                subject.send(SquareMeasure(value: value, kind: .centimeter))
            }
        )
    }
    
    var meter: some View {
        VerticallyLabeledTextField(
            label: "Кв. метр",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в кв. метрах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.meterText,
            onTextChanged: { value in
                subject.send(SquareMeasure(value: value, kind: .meter))
            }
        )
    }
    
    var hectare: some View {
        VerticallyLabeledTextField(
            label: "Гектар",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в гектарах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.hectareText,
            onTextChanged: { value in
                subject.send(SquareMeasure(value: value, kind: .hectare))
            }
        )
    }
}

struct SquareMeasuresView_Previews: PreviewProvider {
    static var previews: some View {
        SquareMeasuresView()
    }
}
