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
        .navigationTitle("Меры сыпучих тел")
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
            label: "Стакан",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в стаканах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.glassText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .glass))
            }
        )
    }
    
    var halfHalfHalfSmallQuadruple: some View {
        VerticallyLabeledTextField(
            label: "Пол-пол-пол-малый четверик",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в пол-пол-пол-малых четвериках",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.halfHalfHalfSmallQuadrupleText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .halfHalfHalfSmallQuadruple))
            }
        )
    }
    
    var halfHalfSmallQuadruple: some View {
        VerticallyLabeledTextField(
            label: "Пол-пол-малый четверик",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в пол-пол-малых четвериках",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.halfHalfSmallQuadrupleText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .halfHalfSmallQuadruple))
            }
        )
    }
    
    var semiGarnet: some View {
        VerticallyLabeledTextField(
            label: "Полугарнец",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в полугарнецах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.semiGarnetText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .semiGarnet))
            }
        )
    }
    
    var garnets: some View {
        VerticallyLabeledTextField(
            label: "Гарнец",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в гарнецах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.garnetsText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .garnets))
            }
        )
    }
    
    var four: some View {
        VerticallyLabeledTextField(
            label: "Четвёрка",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в четвёрках",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.fourText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .four))
            }
        )
    }
    
    var halfQuad: some View {
        VerticallyLabeledTextField(
            label: "Получетверик",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в получетвериках",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.halfQuadText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .halfQuad))
            }
        )
    }
    
    var quad: some View {
        VerticallyLabeledTextField(
            label: "Четверик",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в четвериках",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.quadText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .quad))
            }
        )
    }
    
    var polosmina: some View {
        VerticallyLabeledTextField(
            label: "Полосьмина",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в полосьминах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.polosminaText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .polosmina))
            }
        )
    }
    
    var osmina: some View {
        VerticallyLabeledTextField(
            label: "Осьмина",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в осьминах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.osminaText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .osmina))
            }
        )
    }
    
    var quarter: some View {
        VerticallyLabeledTextField(
            label: "Четверть",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в четвертях",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.quarterText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .quarter))
            }
        )
    }
    
    var polokova: some View {
        VerticallyLabeledTextField(
            label: "Полокова",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в полоковах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.polokovaText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .polokova))
            }
        )
    }
    
    var tub: some View {
        VerticallyLabeledTextField(
            label: "Кадка",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в кадках",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.tubText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .tub))
            }
        )
    }
    
    var cebra: some View {
        VerticallyLabeledTextField(
            label: "Цебр",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в цебрах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.cebraText,
            onTextChanged: { value in
                subject.send(BulkSolidsMeasure(value: value, kind: .cebra))
            }
        )
    }
    
    var liters: some View {
        VerticallyLabeledTextField(
            label: "Литр",
            labelFont: isSystemFontAndSize ? .headline : Config.customFont,
            prompt: "Введите значение в литрах",
            promptFont: isSystemFontAndSize ? .body : Config.customBodyFont,
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
