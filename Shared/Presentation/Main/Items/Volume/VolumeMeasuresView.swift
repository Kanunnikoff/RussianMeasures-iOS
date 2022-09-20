//
//  VolumeMeasuresView.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 28.08.2022.
//

import SwiftUI
import Combine

struct VolumeMeasuresView: View {
    
    private let subject: PassthroughSubject = PassthroughSubject<VolumeMeasure, Never>()
    
    @StateObject private var viewModel = VolumeMeasuresViewModel()
    
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
                        line
                        inch
                        vershok
                        foot
                        arshin
                        fathom
                        
                        VStack(spacing: 24) {
                            millimeter
                            centimeter
                            meter
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
                            millimeter
                            centimeter
                        }
                        
                        GridRow {
                            meter
                        }
                    }
                }
                .padding()
            }
            .scrollDismissesKeyboard(.immediately)
        }
        .navigationTitle(isPreRevolutionary ? "Мѣры объёма" : "Меры объёма")
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
            label: isPreRevolutionary ? "Куб. линія" : "Куб. линия",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ куб. линіяхъ" : "Введите значение в куб. линиях",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.lineText,
            onTextChanged: { value in
                subject.send(VolumeMeasure(value: value, kind: .line))
            }
        )
    }
    
    var inch: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Куб. дюймъ" : "Куб. дюйм",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ куб. дюймахъ" : "Введите значение в куб. дюймах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.inchText,
            onTextChanged: { value in
                subject.send(VolumeMeasure(value: value, kind: .inch))
            }
        )
    }
    
    var vershok: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Куб. вершокъ" : "Куб. вершок",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ куб. вершкахъ" : "Введите значение в куб. вершках",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.vershokText,
            onTextChanged: { value in
                subject.send(VolumeMeasure(value: value, kind: .vershok))
            }
        )
    }
    
    var foot: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Куб. футъ" : "Куб. фут",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ куб. футахъ" : "Введите значение в куб. футах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.footText,
            onTextChanged: { value in
                subject.send(VolumeMeasure(value: value, kind: .foot))
            }
        )
    }
    
    var arshin: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Куб. аршинъ" : "Куб. аршин",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ куб. аршинахъ" : "Введите значение в куб. аршинах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.arshinText,
            onTextChanged: { value in
                subject.send(VolumeMeasure(value: value, kind: .arshin))
            }
        )
    }
    
    var fathom: some View {
        VerticallyLabeledTextField(
            label: "Куб. сажень",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ куб. саженяхъ" : "Введите значение в куб. саженях",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.fathomText,
            onTextChanged: { value in
                subject.send(VolumeMeasure(value: value, kind: .fathom))
            }
        )
    }
    
    var millimeter: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Куб. миллиметръ" : "Куб. миллиметр",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ куб. миллиметрахъ" : "Введите значение в куб. миллиметрах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.millimeterText,
            onTextChanged: { value in
                subject.send(VolumeMeasure(value: value, kind: .millimeter))
            }
        )
    }
    
    var centimeter: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Куб. сантиметръ" : "Куб. сантиметр",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ куб. сантиметрахъ" : "Введите значение в куб. сантиметрах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.millimeterText,
            onTextChanged: { value in
                subject.send(VolumeMeasure(value: value, kind: .centimeter))
            }
        )
    }
    
    var meter: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Куб. метръ" : "Куб. метр",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ куб. метрахъ" : "Введите значение в куб. метрах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.meterText,
            onTextChanged: { value in
                subject.send(VolumeMeasure(value: value, kind: .meter))
            }
        )
    }
}

struct VolumeMeasuresView_Previews: PreviewProvider {
    static var previews: some View {
        VolumeMeasuresView()
    }
}
