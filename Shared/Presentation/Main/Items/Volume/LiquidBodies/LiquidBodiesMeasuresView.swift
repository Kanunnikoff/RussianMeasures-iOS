//
//  LiquidBodiesMeasuresView.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 04.09.2022.
//

import SwiftUI
import Combine

struct LiquidBodiesMeasuresView: View {
    
    private let subject: PassthroughSubject = PassthroughSubject<LiquidBodiesMeasure, Never>()
    
    @StateObject private var viewModel = LiquidBodiesMeasuresViewModel()
    
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
                        scale
                        cup
                        chetushka
                        glass
                        pigtail
                        vodkaBottle
                        wineBottle
                        damask
                        octagonalDamask
                        
                        VStack(spacing: 24) {
                            garnet
                            quarter
                            bucket
                            korchaga
                            barrel
                            liters
                        }
                    } else {
                        GridRow {
                            scale
                            cup
                        }
                        
                        GridRow {
                            chetushka
                            glass
                        }
                        
                        GridRow {
                            pigtail
                            vodkaBottle
                        }
                        
                        GridRow {
                            wineBottle
                            damask
                        }
                        
                        GridRow {
                            octagonalDamask
                            garnet
                        }
                        
                        GridRow {
                            quarter
                            bucket
                        }
                        
                        GridRow {
                            korchaga
                            barrel
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
        .navigationTitle(isPreRevolutionary ? "Мѣры жидкихъ тѣлъ" : "Меры жидких тел")
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
    
    var scale: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Шкаликъ" : "Шкалик",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ ​шкаликахъ​" : "Введите значение в шкаликах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.scaleText,
            onTextChanged: { value in
                subject.send(LiquidBodiesMeasure(value: value, kind: .scale))
            }
        )
    }
    
    var cup: some View {
        VerticallyLabeledTextField(
            label: "Чарка",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ чаркахъ" : "Введите значение в чарках",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.cupText,
            onTextChanged: { value in
                subject.send(LiquidBodiesMeasure(value: value, kind: .cup))
            }
        )
    }
    
    var chetushka: some View {
        VerticallyLabeledTextField(
            label: "Четушка",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ ​четушкахъ" : "Введите значение в четушках",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.chetushkaText,
            onTextChanged: { value in
                subject.send(LiquidBodiesMeasure(value: value, kind: .chetushka))
            }
        )
    }
    
    var glass: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Стаканъ" : "Стакан",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ стаканахъ" : "Введите значение в стаканах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.glassText,
            onTextChanged: { value in
                subject.send(LiquidBodiesMeasure(value: value, kind: .glass))
            }
        )
    }
    
    var pigtail: some View {
        VerticallyLabeledTextField(
            label: "Косушка",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ ​косушкахъ​" : "Введите значение в косушках",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.pigtailText,
            onTextChanged: { value in
                subject.send(LiquidBodiesMeasure(value: value, kind: .pigtail))
            }
        )
    }
    
    var vodkaBottle: some View {
        VerticallyLabeledTextField(
            label: "Водочная (пивная) бутылка",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ водочныхъ бутылкахъ" : "Введите значение в водочных бутылках",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.vodkaBottleText,
            onTextChanged: { value in
                subject.send(LiquidBodiesMeasure(value: value, kind: .vodkaBottle))
            }
        )
    }
    
    var wineBottle: some View {
        VerticallyLabeledTextField(
            label: "Винная бутылка",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ винныхъ бутылкахъ" : "Введите значение в винных бутылках",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.wineBottleText,
            onTextChanged: { value in
                subject.send(LiquidBodiesMeasure(value: value, kind: .wineBottle))
            }
        )
    }
    
    var damask: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Штофъ" : "Штоф",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ ​штофахъ​" : "Введите значение в штофах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.damaskText,
            onTextChanged: { value in
                subject.send(LiquidBodiesMeasure(value: value, kind: .damask))
            }
        )
    }
    
    var octagonalDamask: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Штофъ осьмериковый" : "Штоф осьмериковый",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ ​штофахъ​ ​осьмериковыхъ" : "Введите значение в штофах осьмериковых",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.octagonalDamaskText,
            onTextChanged: { value in
                subject.send(LiquidBodiesMeasure(value: value, kind: .octagonalDamask))
            }
        )
    }
    
    var garnet: some View {
        VerticallyLabeledTextField(
            label: isPreRevolutionary ? "Гарнецъ" : "Гарнец",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ ​гарнецахъ" : "Введите значение в гарнецах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.garnetText,
            onTextChanged: { value in
                subject.send(LiquidBodiesMeasure(value: value, kind: .garnet))
            }
        )
    }
    
    var quarter: some View {
        VerticallyLabeledTextField(
            label: "Четверть (ведра)",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ четвертяхъ" : "Введите значение в четвертях",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.quarterText,
            onTextChanged: { value in
                subject.send(LiquidBodiesMeasure(value: value, kind: .quarter))
            }
        )
    }
    
    var bucket: some View {
        VerticallyLabeledTextField(
            label: "Ведро",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ ведрахъ" : "Введите значение в вёдрах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.bucketText,
            onTextChanged: { value in
                subject.send(LiquidBodiesMeasure(value: value, kind: .bucket))
            }
        )
    }
    
    var korchaga: some View {
        VerticallyLabeledTextField(
            label: "Корчага",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ ​корчагахъ" : "Введите значение в корчагах",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.korchagaText,
            onTextChanged: { value in
                subject.send(LiquidBodiesMeasure(value: value, kind: .korchaga))
            }
        )
    }
    
    var barrel: some View {
        VerticallyLabeledTextField(
            label: "Бочка",
            labelFont: isSystemFontAndSize ? .headline : Config.customHeadlineFont,
            title: isPreRevolutionary ? "Введите значеніе въ бочкахъ" : "Введите значение в бочках",
            font: isSystemFontAndSize ? .body : Config.customBodyFont,
            text: $viewModel.barrelText,
            onTextChanged: { value in
                subject.send(LiquidBodiesMeasure(value: value, kind: .barrel))
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
                subject.send(LiquidBodiesMeasure(value: value, kind: .liter))
            }
        )
    }
}

struct LiquidBodiesMeasuresView_Previews: PreviewProvider {
    static var previews: some View {
        LiquidBodiesMeasuresView()
    }
}
