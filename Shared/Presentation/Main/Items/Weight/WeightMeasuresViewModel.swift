//
//  WeightMeasuresViewModel.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 04.09.2022.
//

import Foundation

class WeightMeasuresViewModel: ObservableObject {
    
    private let SHARE_GRAMS = 0.0444
    private let BUD_GRAMS = 0.17
    private let SPOOL_GRAMS = 4.2657
    private let LOT_GRAMS = 12.79726
    private let POUND_GRAMS = 409.5124
    private let PUD_GRAMS = 16380.4964
    private let BERKOVETS_GRAMS = 163000.8
    private let KILOGRAM_GRAMS = 1000.0
    
    @Published var shareText: String = ""
    @Published var budText: String = ""
    @Published var spoolText: String = ""
    @Published var lotText: String = ""
    @Published var poundText: String = ""
    @Published var pudText: String = ""
    @Published var berkovetsText: String = ""
    @Published var gramText: String = ""
    @Published var kilogramText: String = ""
    
    func convert(measure: WeightMeasure) {
        guard let value = try? Double(measure.value, format: .localizedDouble(locale: Locale.current)) else {
            clearAllValues()
            return
        }
        
        switch measure.kind {
            case .share:
                let grams = value * SHARE_GRAMS
                
                budText = Util.format(value: grams / BUD_GRAMS)
                spoolText = Util.format(value: grams / SPOOL_GRAMS)
                lotText = Util.format(value: grams / LOT_GRAMS)
                poundText = Util.format(value: grams / POUND_GRAMS)
                pudText = Util.format(value: grams / PUD_GRAMS)
                berkovetsText = Util.format(value: grams / BERKOVETS_GRAMS)
                gramText = Util.format(value: grams)
                kilogramText = Util.format(value: grams / KILOGRAM_GRAMS)
                
            case .bud:
                let grams = value * BUD_GRAMS
                
                shareText = Util.format(value: grams / SHARE_GRAMS)
                spoolText = Util.format(value: grams / SPOOL_GRAMS)
                lotText = Util.format(value: grams / LOT_GRAMS)
                poundText = Util.format(value: grams / POUND_GRAMS)
                pudText = Util.format(value: grams / PUD_GRAMS)
                berkovetsText = Util.format(value: grams / BERKOVETS_GRAMS)
                gramText = Util.format(value: grams)
                kilogramText = Util.format(value: grams / KILOGRAM_GRAMS)
                
            case .spool:
                let grams = value * SPOOL_GRAMS
                
                shareText = Util.format(value: grams / SHARE_GRAMS)
                budText = Util.format(value: grams / BUD_GRAMS)
                lotText = Util.format(value: grams / LOT_GRAMS)
                poundText = Util.format(value: grams / POUND_GRAMS)
                pudText = Util.format(value: grams / PUD_GRAMS)
                berkovetsText = Util.format(value: grams / BERKOVETS_GRAMS)
                gramText = Util.format(value: grams)
                kilogramText = Util.format(value: grams / KILOGRAM_GRAMS)
                
            case .lot:
                let grams = value * LOT_GRAMS
                
                shareText = Util.format(value: grams / SHARE_GRAMS)
                budText = Util.format(value: grams / BUD_GRAMS)
                spoolText = Util.format(value: grams / SPOOL_GRAMS)
                poundText = Util.format(value: grams / POUND_GRAMS)
                pudText = Util.format(value: grams / PUD_GRAMS)
                berkovetsText = Util.format(value: grams / BERKOVETS_GRAMS)
                gramText = Util.format(value: grams)
                kilogramText = Util.format(value: grams / KILOGRAM_GRAMS)
                
            case .pound:
                let grams = value * POUND_GRAMS
                
                shareText = Util.format(value: grams / SHARE_GRAMS)
                budText = Util.format(value: grams / BUD_GRAMS)
                spoolText = Util.format(value: grams / SPOOL_GRAMS)
                lotText = Util.format(value: grams / LOT_GRAMS)
                pudText = Util.format(value: grams / PUD_GRAMS)
                berkovetsText = Util.format(value: grams / BERKOVETS_GRAMS)
                gramText = Util.format(value: grams)
                kilogramText = Util.format(value: grams / KILOGRAM_GRAMS)
                
            case .pud:
                let grams = value * PUD_GRAMS
                
                shareText = Util.format(value: grams / SHARE_GRAMS)
                budText = Util.format(value: grams / BUD_GRAMS)
                spoolText = Util.format(value: grams / SPOOL_GRAMS)
                lotText = Util.format(value: grams / LOT_GRAMS)
                poundText = Util.format(value: grams / POUND_GRAMS)
                berkovetsText = Util.format(value: grams / BERKOVETS_GRAMS)
                gramText = Util.format(value: grams)
                kilogramText = Util.format(value: grams / KILOGRAM_GRAMS)
                
            case .berkovets:
                let grams = value * BERKOVETS_GRAMS
                
                shareText = Util.format(value: grams / SHARE_GRAMS)
                budText = Util.format(value: grams / BUD_GRAMS)
                spoolText = Util.format(value: grams / SPOOL_GRAMS)
                lotText = Util.format(value: grams / LOT_GRAMS)
                poundText = Util.format(value: grams / POUND_GRAMS)
                pudText = Util.format(value: grams / PUD_GRAMS)
                gramText = Util.format(value: grams)
                kilogramText = Util.format(value: grams / KILOGRAM_GRAMS)
                
            case .gram:
                let grams = value
                
                shareText = Util.format(value: grams / SHARE_GRAMS)
                budText = Util.format(value: grams / BUD_GRAMS)
                spoolText = Util.format(value: grams / SPOOL_GRAMS)
                lotText = Util.format(value: grams / LOT_GRAMS)
                poundText = Util.format(value: grams / POUND_GRAMS)
                pudText = Util.format(value: grams / PUD_GRAMS)
                berkovetsText = Util.format(value: grams / BERKOVETS_GRAMS)
                kilogramText = Util.format(value: grams / KILOGRAM_GRAMS)
                
            case .kilogram:
                let grams = value * KILOGRAM_GRAMS
                
                shareText = Util.format(value: grams / SHARE_GRAMS)
                budText = Util.format(value: grams / BUD_GRAMS)
                spoolText = Util.format(value: grams / SPOOL_GRAMS)
                lotText = Util.format(value: grams / LOT_GRAMS)
                poundText = Util.format(value: grams / POUND_GRAMS)
                pudText = Util.format(value: grams / PUD_GRAMS)
                berkovetsText = Util.format(value: grams / BERKOVETS_GRAMS)
                gramText = Util.format(value: grams)
        }
    }
    
    private func clearAllValues() {
        shareText = ""
        budText = ""
        spoolText = ""
        lotText = ""
        poundText = ""
        pudText = ""
        berkovetsText = ""
        gramText = ""
        kilogramText = ""
    }
}
