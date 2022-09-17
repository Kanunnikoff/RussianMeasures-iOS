//
//  LengthMeasures.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 21.08.2022.
//

import SwiftUI
import Combine

struct LengthMeasuresView: View {
    
    private let subject: PassthroughSubject = PassthroughSubject<LengthMeasure, Never>()
    
    @StateObject private var viewModel = LengthMeasuresViewModel()
    
    @State private var cancellable: Cancellable? = nil
    
    @AppStorage("SettingsView.isSystemFontAndSize")
    private var isSystemFontAndSize: Bool = true
    
    var body: some View {
        WidthThresholdReader(widthThreshold: 520) { proxy in
            ScrollView(showsIndicators: false) {
                Grid(horizontalSpacing: 12, verticalSpacing: 24) {
                    if proxy.isCompact {
                        dot
                        line
                        weaving
                        inch
                        vershok
                        quarter
                        foot
                        arshin
                        fathom
                        
                        VStack(spacing: 24) {
                            verst
                            millimeter
                            meter
                        }
                    } else {
                        GridRow {
                            dot
                            line
                        }
                        
                        GridRow {
                            weaving
                            inch
                        }
                        
                        GridRow {
                            vershok
                            quarter
                        }
                        
                        GridRow {
                            foot
                            arshin
                        }
                        
                        GridRow {
                            fathom
                            verst
                        }
                        
                        GridRow {
                            millimeter
                            meter
                        }
                    }
                }
                .padding()
            }
            .scrollDismissesKeyboard(.immediately)
        }
        .navigationTitle("Меры длины")
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
    
    var dot: some View {
        VerticallyLabeledTextField(
            label: "Точка",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: "Введите значение в точках",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.dotText,
            onTextChanged: { value in
                subject.send(LengthMeasure(value: value, kind: .dot))
            }
        )
    }
    
    var line: some View {
        VerticallyLabeledTextField(
            label: "Линия",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: "Введите значение в линиях",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.lineText,
            onTextChanged: { value in
                subject.send(LengthMeasure(value: value, kind: .line))
            }
        )
    }
    
    var weaving: some View {
        VerticallyLabeledTextField(
            label: "Сотка",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: "Введите значение в сотках",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.weavingText,
            onTextChanged: { value in
                subject.send(LengthMeasure(value: value, kind: .weaving))
            }
        )
    }
    
    var inch: some View {
        VerticallyLabeledTextField(
            label: "Дюйм",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: "Введите значение в дюймах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.inchText,
            onTextChanged: { value in
                subject.send(LengthMeasure(value: value, kind: .inch))
            }
        )
    }
    
    var vershok: some View {
        VerticallyLabeledTextField(
            label: "Вершок",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: "Введите значение в вершках",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.vershokText,
            onTextChanged: { value in
                subject.send(LengthMeasure(value: value, kind: .vershok))
            }
        )
    }
    
    var quarter: some View {
        VerticallyLabeledTextField(
            label: "Четверть (пядь)",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: "Введите значение в четвертях",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.quarterText,
            onTextChanged: { value in
                subject.send(LengthMeasure(value: value, kind: .quarter))
            }
        )
    }
    
    var foot: some View {
        VerticallyLabeledTextField(
            label: "Фут",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: "Введите значение в футах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.footText,
            onTextChanged: { value in
                subject.send(LengthMeasure(value: value, kind: .foot))
            }
        )
    }
    
    var arshin: some View {
        VerticallyLabeledTextField(
            label: "Аршин (шаг)",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: "Введите значение в аршинах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.arshinText,
            onTextChanged: { value in
                subject.send(LengthMeasure(value: value, kind: .arshin))
            }
        )
    }
    
    var fathom: some View {
        VerticallyLabeledTextField(
            label: "Сажень",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: "Введите значение в саженях",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.fathomText,
            onTextChanged: { value in
                subject.send(LengthMeasure(value: value, kind: .fathom))
            }
        )
    }
    
    var verst: some View {
        VerticallyLabeledTextField(
            label: "Верста",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: "Введите значение в вёрстах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.verstText,
            onTextChanged: { value in
                subject.send(LengthMeasure(value: value, kind: .verst))
            }
        )
    }
    
    var millimeter: some View {
        VerticallyLabeledTextField(
            label: "Миллиметр",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: "Введите значение в миллиметрах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.millimeterText,
            onTextChanged: { value in
                subject.send(LengthMeasure(value: value, kind: .millimeter))
            }
        )
    }
    
    var meter: some View {
        VerticallyLabeledTextField(
            label: "Метр",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: "Введите значение в метрах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.meterText,
            onTextChanged: { value in
                subject.send(LengthMeasure(value: value, kind: .meter))
            }
        )
    }
}

struct LengthMeasuresView_Previews: PreviewProvider {
    
    static var previews: some View {
        LengthMeasuresView()
    }
}
