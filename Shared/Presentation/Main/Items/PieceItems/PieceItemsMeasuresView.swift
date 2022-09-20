//
//  PieceItemsMeasuresView.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 10.09.2022.
//

import SwiftUI
import Combine

struct PieceItemsMeasuresView: View {
    
    private let subject: PassthroughSubject = PassthroughSubject<PieceItemsMeasure, Never>()
    
    @StateObject private var viewModel = PieceItemsMeasuresViewModel()
    
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
                        pair
                        dozen
                        gross
                        mass
                        piece
                    } else {
                        GridRow {
                            pair
                            dozen
                        }
                        
                        GridRow {
                            gross
                            mass
                        }
                        
                        GridRow {
                            piece
                        }
                    }
                }
                .padding()
            }
            .scrollDismissesKeyboard(.immediately)
        }
        .navigationTitle(isPreRevolutionary ? "Поштучныя" : "Поштучные")
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
    
    var pair: some View {
        VerticallyLabeledTextField(
            label: "Пара",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ парахъ" : "Введите значение в парах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.pairText,
            onTextChanged: { value in
                subject.send(PieceItemsMeasure(value: value, kind: .pair))
            }
        )
    }
    
    var dozen: some View {
        VerticallyLabeledTextField(
            label: "Дюжина",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ дюжинахъ" : "Введите значение в дюжинах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.dozenText,
            onTextChanged: { value in
                subject.send(PieceItemsMeasure(value: value, kind: .dozen))
            }
        )
    }
    
    var gross: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Гроссъ" : "Гросс",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ ​гроссахъ" : "Введите значение в гроссах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.grossText,
            onTextChanged: { value in
                subject.send(PieceItemsMeasure(value: value, kind: .gross))
            }
        )
    }
    
    var mass: some View {
        VerticallyLabeledTextField(
            label: "Масса",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ массахъ" : "Введите значение в массах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.massText,
            onTextChanged: { value in
                subject.send(PieceItemsMeasure(value: value, kind: .mass))
            }
        )
    }
    
    var piece: some View {
        VerticallyLabeledTextField(
            label: "Штука",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ штукахъ" : "Введите значение в штуках",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.pieceText,
            onTextChanged: { value in
                subject.send(PieceItemsMeasure(value: value, kind: .piece))
            }
        )
    }
}

struct PieceItemsMeasuresView_Previews: PreviewProvider {
    static var previews: some View {
        PieceItemsMeasuresView()
    }
}
