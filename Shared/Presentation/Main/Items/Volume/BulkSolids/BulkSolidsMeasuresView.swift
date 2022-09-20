//
//  BulkSolidsMeasuresView.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 03.09.2022.
//

import SwiftUI
import Combine

struct BulkSolidsMeasuresView: View {
    
    private let subject: PassthroughSubject = PassthroughSubject<BulkSolidsMeasure, Never>()
    
    @StateObject private var viewModel = BulkSolidsMeasuresViewModel()
    
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
                        glass
                        halfHalfHalfSmallQuadruple
                        halfHalfSmallQuadruple
                        semiGarnet
                        garnets
                        four
                        halfQuad
                        quad
                        polosmina
                        
                        VStack(spacing: 24) {
                            osmina
                            quarter
                            polokova
                            tub
                            cebra
                            liters
                        }
                    } else {
                        GridRow {
                            glass
                            halfHalfHalfSmallQuadruple
                        }
                        
                        GridRow {
                            halfHalfSmallQuadruple
                            semiGarnet
                        }
                        
                        GridRow {
                            garnets
                            four
                        }
                        
                        GridRow {
                            halfQuad
                            quad
                        }
                        
                        GridRow {
                            polosmina
                            osmina
                        }
                        
                        GridRow {
                            quarter
                            polokova
                        }
                        
                        GridRow {
                            tub
                            cebra
                        }
                        
                        GridRow {
                            liters
                        }
                    }
                }
                .padding()
            }
            .scrollDismissesKeyboard(.immediately)
        }
        .navigationTitle(isPreRevolutionary ? "Мѣры сыпучихъ тѣлъ" : "Меры сыпучих тел")
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
    
    var glass: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Стаканъ" : "Стакан",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ стаканахъ" : "Введите значение в стаканах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.glassText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .glass))
            }
        )
    }
    
    var halfHalfHalfSmallQuadruple: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Полъ-полъ-полъ-малый ​четверикъ​" : "Пол-пол-пол-малый четверик",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ полъ-полъ-полъ-малыхъ ​четверикахъ​" : "Введите значение в пол-пол-пол-малых четвериках",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.halfHalfHalfSmallQuadrupleText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .halfHalfHalfSmallQuadruple))
            }
        )
    }
    
    var halfHalfSmallQuadruple: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Полъ-полъ-малый ​четверикъ​" : "Пол-пол-малый четверик",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ полъ-полъ-малыхъ ​четверикахъ" : "Введите значение в пол-пол-малых четвериках",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.halfHalfSmallQuadrupleText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .halfHalfSmallQuadruple))
            }
        )
    }
    
    var semiGarnet: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Полугарнецъ" : "Полугарнец",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ полугарнецахъ" : "Введите значение в полугарнецах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.semiGarnetText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .semiGarnet))
            }
        )
    }
    
    var garnets: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Гарнецъ" : "Гарнец",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ ​гарнецахъ" : "Введите значение в гарнецах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.garnetsText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .garnets))
            }
        )
    }
    
    var four: some View {
        VerticallyLabeledTextField(
            label: "Четвёрка",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ четверкахъ" : "Введите значение в четвёрках",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.fourText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .four))
            }
        )
    }
    
    var halfQuad: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Получетверикъ" : "Получетверик",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ получетверикахъ" : "Введите значение в получетвериках",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.halfQuadText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .halfQuad))
            }
        )
    }
    
    var quad: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Четверикъ" : "Четверик",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ ​четверикахъ" : "Введите значение в четвериках",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.quadText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .quad))
            }
        )
    }
    
    var polosmina: some View {
        VerticallyLabeledTextField(
            label: "Полосьмина",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ полосьминахъ" : "Введите значение в полосьминах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.polosminaText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .polosmina))
            }
        )
    }
    
    var osmina: some View {
        VerticallyLabeledTextField(
            label: "Осьмина",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ ​осьминахъ" : "Введите значение в осьминах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.osminaText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .osmina))
            }
        )
    }
    
    var quarter: some View {
        VerticallyLabeledTextField(
            label: "Четверть",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ четвертяхъ" : "Введите значение в четвертях",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.quarterText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .quarter))
            }
        )
    }
    
    var polokova: some View {
        VerticallyLabeledTextField(
            label: "Полокова",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ ​полоковахъ" : "Введите значение в полоковах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.polokovaText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .polokova))
            }
        )
    }
    
    var tub: some View {
        VerticallyLabeledTextField(
            label: "Кадка",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ кадкахъ" : "Введите значение в кадках",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.tubText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .tub))
            }
        )
    }
    
    var cebra: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Цебръ" : "Цебр",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ ​цебрахъ" : "Введите значение в цебрах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.cebraText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .cebra))
            }
        )
    }
    
    var liters: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Литръ" : "Литр",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ литрахъ" : "Введите значение в литрах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.literText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .liter))
            }
        )
    }
}

struct BulkSolidsMeasuresView_Previews: PreviewProvider {
    static var previews: some View {
        BulkSolidsMeasuresView()
    }
}
