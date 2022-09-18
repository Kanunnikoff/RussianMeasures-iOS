//
//  PharmaceuticalMeasuresViewModel.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 10.09.2022.
//

import Foundation

class PharmaceuticalMeasuresViewModel: ObservableObject {
    
    private let GRAN_MILLIGRAMS = 62.209
    private let SCRUPLE_MILLIGRAMS = 1_244.0
    private let DRACHMA_MILLIGRAMS = 3_732.0
    private let OUNCE_MILLIGRAMS = 29_860.0
    private let POUND_MILLIGRAMS = 358_323.0
    private let GRAM_MILLIGRAMS = 1_000.0
    
    @Published var granText: String = ""
    @Published var scrupleText: String = ""
    @Published var drachmaText: String = ""
    @Published var ounceText: String = ""
    @Published var poundText: String = ""
    @Published var milligramText: String = ""
    @Published var gramText: String = ""
    
    func convert(measure: PharmaceuticalMeasure) {
        guard let value = try? Double(measure.value, format: .localizedDouble(locale: Locale.current)) else {
            clearAllValues()
            return
        }
        
        switch measure.kind {
            case .gran:
                let milligrams = value * GRAN_MILLIGRAMS
                
                scrupleText = Util.format(value: milligrams / SCRUPLE_MILLIGRAMS)
                drachmaText = Util.format(value: milligrams / DRACHMA_MILLIGRAMS)
                ounceText = Util.format(value: milligrams / OUNCE_MILLIGRAMS)
                poundText = Util.format(value: milligrams / POUND_MILLIGRAMS)
                milligramText = Util.format(value: milligrams)
                gramText = Util.format(value: milligrams / GRAM_MILLIGRAMS)
                
            case .scruple:
                let milligrams = value * SCRUPLE_MILLIGRAMS
                
                granText = Util.format(value: milligrams / GRAN_MILLIGRAMS)
                drachmaText = Util.format(value: milligrams / DRACHMA_MILLIGRAMS)
                ounceText = Util.format(value: milligrams / OUNCE_MILLIGRAMS)
                poundText = Util.format(value: milligrams / POUND_MILLIGRAMS)
                milligramText = Util.format(value: milligrams)
                gramText = Util.format(value: milligrams / GRAM_MILLIGRAMS)
                
            case .drachma:
                let milligrams = value * DRACHMA_MILLIGRAMS
                
                granText = Util.format(value: milligrams / GRAN_MILLIGRAMS)
                scrupleText = Util.format(value: milligrams / SCRUPLE_MILLIGRAMS)
                ounceText = Util.format(value: milligrams / OUNCE_MILLIGRAMS)
                poundText = Util.format(value: milligrams / POUND_MILLIGRAMS)
                milligramText = Util.format(value: milligrams)
                gramText = Util.format(value: milligrams / GRAM_MILLIGRAMS)
                
            case .ounce:
                let milligrams = value * OUNCE_MILLIGRAMS
                
                granText = Util.format(value: milligrams / GRAN_MILLIGRAMS)
                scrupleText = Util.format(value: milligrams / SCRUPLE_MILLIGRAMS)
                drachmaText = Util.format(value: milligrams / DRACHMA_MILLIGRAMS)
                poundText = Util.format(value: milligrams / POUND_MILLIGRAMS)
                milligramText = Util.format(value: milligrams)
                gramText = Util.format(value: milligrams / GRAM_MILLIGRAMS)
                
            case .pound:
                let milligrams = value * POUND_MILLIGRAMS
                
                granText = Util.format(value: milligrams / GRAN_MILLIGRAMS)
                scrupleText = Util.format(value: milligrams / SCRUPLE_MILLIGRAMS)
                drachmaText = Util.format(value: milligrams / DRACHMA_MILLIGRAMS)
                ounceText = Util.format(value: milligrams / OUNCE_MILLIGRAMS)
                milligramText = Util.format(value: milligrams)
                gramText = Util.format(value: milligrams / GRAM_MILLIGRAMS)
                
            case .milligram:
                let milligrams = value
                
                granText = Util.format(value: milligrams / GRAN_MILLIGRAMS)
                scrupleText = Util.format(value: milligrams / SCRUPLE_MILLIGRAMS)
                drachmaText = Util.format(value: milligrams / DRACHMA_MILLIGRAMS)
                ounceText = Util.format(value: milligrams / OUNCE_MILLIGRAMS)
                poundText = Util.format(value: milligrams / POUND_MILLIGRAMS)
                gramText = Util.format(value: milligrams / GRAM_MILLIGRAMS)
                
            case .gram:
                let milligrams = value * GRAM_MILLIGRAMS
                
                granText = Util.format(value: milligrams / GRAN_MILLIGRAMS)
                scrupleText = Util.format(value: milligrams / SCRUPLE_MILLIGRAMS)
                drachmaText = Util.format(value: milligrams / DRACHMA_MILLIGRAMS)
                ounceText = Util.format(value: milligrams / OUNCE_MILLIGRAMS)
                poundText = Util.format(value: milligrams / POUND_MILLIGRAMS)
                milligramText = Util.format(value: milligrams)
        }
    }
    
    private func clearAllValues() {
        granText = ""
        scrupleText = ""
        drachmaText = ""
        ounceText = ""
        poundText = ""
        milligramText = ""
        gramText = ""
    }
}
