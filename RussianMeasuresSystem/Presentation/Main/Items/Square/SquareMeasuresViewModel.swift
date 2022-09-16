//
//  SquareMeasuresViewModel.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 28.08.2022.
//

import Foundation

class SquareMeasuresViewModel: ObservableObject {
    
    private let LINE_MILLIMETERS = 6.4516
    private let INCH_MILLIMETERS = 645.16
    private let VERSHOK_MILLIMETERS = 1_975.8
    private let FOOT_MILLIMETERS = 92_903.04
    private let ARSHIN_MILLIMETERS = 505_805.0
    private let FATHOM_MILLIMETERS = 4_552_250.0
    private let OSMINNIK_MILLIMETERS = 1_365_675_000.0
    private let CHET_MILLIMETERS = 5_462_700_000.0
    private let DESSIATIN_MILLIMETERS = 10_925_400_000.0
    private let VERST_MILLIMETERS = 1_138_100_000_000.0
    private let CENTIMETER_MILLIMETERS = 100.0
    private let METER_MILLIMETERS = 1_000_000.0
    private let HECTARE_MILLIMETERS = 10_000_000_000.0
    
    private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 6
        formatter.groupingSeparator = " "
        
        return formatter
    }()
    
    @Published var lineText: String = ""
    @Published var inchText: String = ""
    @Published var vershokText: String = ""
    @Published var footText: String = ""
    @Published var arshinText: String = ""
    @Published var fathomText: String = ""
    @Published var osminnikText: String = ""
    @Published var chetText: String = ""
    @Published var dessiatinText: String = ""
    @Published var verstText: String = ""
    @Published var millimeterText: String = ""
    @Published var centimeterText: String = ""
    @Published var meterText: String = ""
    @Published var hectareText: String = ""
    
    func convert(measure: SquareMeasure) {
        guard let value = try? Double(measure.value, format: .localizedDouble(locale: Locale.current)) else {
            clearAllValues()
            return
        }
        
        switch measure.kind {
            case .line:
                let millimeters = value * LINE_MILLIMETERS
                
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                osminnikText = format(value: millimeters / OSMINNIK_MILLIMETERS)
                chetText = format(value: millimeters / CHET_MILLIMETERS)
                dessiatinText = format(value: millimeters / DESSIATIN_MILLIMETERS)
                verstText = format(value: millimeters / VERST_MILLIMETERS)
                millimeterText = format(value: millimeters)
                centimeterText = format(value: millimeters / CENTIMETER_MILLIMETERS)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                hectareText = format(value: millimeters / HECTARE_MILLIMETERS)
                
            case .inch:
                let millimeters = value * INCH_MILLIMETERS
                
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                osminnikText = format(value: millimeters / OSMINNIK_MILLIMETERS)
                chetText = format(value: millimeters / CHET_MILLIMETERS)
                dessiatinText = format(value: millimeters / DESSIATIN_MILLIMETERS)
                verstText = format(value: millimeters / VERST_MILLIMETERS)
                millimeterText = format(value: millimeters)
                centimeterText = format(value: millimeters / CENTIMETER_MILLIMETERS)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                hectareText = format(value: millimeters / HECTARE_MILLIMETERS)
                
            case .vershok:
                let millimeters = value * VERSHOK_MILLIMETERS
                
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                osminnikText = format(value: millimeters / OSMINNIK_MILLIMETERS)
                chetText = format(value: millimeters / CHET_MILLIMETERS)
                dessiatinText = format(value: millimeters / DESSIATIN_MILLIMETERS)
                verstText = format(value: millimeters / VERST_MILLIMETERS)
                millimeterText = format(value: millimeters)
                centimeterText = format(value: millimeters / CENTIMETER_MILLIMETERS)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                hectareText = format(value: millimeters / HECTARE_MILLIMETERS)
                
            case .foot:
                let millimeters = value * FOOT_MILLIMETERS
                
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                osminnikText = format(value: millimeters / OSMINNIK_MILLIMETERS)
                chetText = format(value: millimeters / CHET_MILLIMETERS)
                dessiatinText = format(value: millimeters / DESSIATIN_MILLIMETERS)
                verstText = format(value: millimeters / VERST_MILLIMETERS)
                millimeterText = format(value: millimeters)
                centimeterText = format(value: millimeters / CENTIMETER_MILLIMETERS)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                hectareText = format(value: millimeters / HECTARE_MILLIMETERS)
                
            case .arshin:
                let millimeters = value * ARSHIN_MILLIMETERS
                
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                osminnikText = format(value: millimeters / OSMINNIK_MILLIMETERS)
                chetText = format(value: millimeters / CHET_MILLIMETERS)
                dessiatinText = format(value: millimeters / DESSIATIN_MILLIMETERS)
                verstText = format(value: millimeters / VERST_MILLIMETERS)
                millimeterText = format(value: millimeters)
                centimeterText = format(value: millimeters / CENTIMETER_MILLIMETERS)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                hectareText = format(value: millimeters / HECTARE_MILLIMETERS)
                
            case .fathom:
                let millimeters = value * FATHOM_MILLIMETERS
                
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                osminnikText = format(value: millimeters / OSMINNIK_MILLIMETERS)
                chetText = format(value: millimeters / CHET_MILLIMETERS)
                dessiatinText = format(value: millimeters / DESSIATIN_MILLIMETERS)
                verstText = format(value: millimeters / VERST_MILLIMETERS)
                millimeterText = format(value: millimeters)
                centimeterText = format(value: millimeters / CENTIMETER_MILLIMETERS)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                hectareText = format(value: millimeters / HECTARE_MILLIMETERS)
            
            case .osminnik:
                let millimeters = value * OSMINNIK_MILLIMETERS
                
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                chetText = format(value: millimeters / CHET_MILLIMETERS)
                dessiatinText = format(value: millimeters / DESSIATIN_MILLIMETERS)
                verstText = format(value: millimeters / VERST_MILLIMETERS)
                millimeterText = format(value: millimeters)
                centimeterText = format(value: millimeters / CENTIMETER_MILLIMETERS)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                hectareText = format(value: millimeters / HECTARE_MILLIMETERS)
                
            case .chet:
                let millimeters = value * CHET_MILLIMETERS
                
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                osminnikText = format(value: millimeters / OSMINNIK_MILLIMETERS)
                dessiatinText = format(value: millimeters / DESSIATIN_MILLIMETERS)
                verstText = format(value: millimeters / VERST_MILLIMETERS)
                millimeterText = format(value: millimeters)
                centimeterText = format(value: millimeters / CENTIMETER_MILLIMETERS)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                hectareText = format(value: millimeters / HECTARE_MILLIMETERS)
            
            case .dessiatin:
                let millimeters = value * DESSIATIN_MILLIMETERS
                
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                osminnikText = format(value: millimeters / OSMINNIK_MILLIMETERS)
                chetText = format(value: millimeters / CHET_MILLIMETERS)
                verstText = format(value: millimeters / VERST_MILLIMETERS)
                millimeterText = format(value: millimeters)
                centimeterText = format(value: millimeters / CENTIMETER_MILLIMETERS)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                hectareText = format(value: millimeters / HECTARE_MILLIMETERS)
                
            case .verst:
                let millimeters = value * VERST_MILLIMETERS
                
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                osminnikText = format(value: millimeters / OSMINNIK_MILLIMETERS)
                chetText = format(value: millimeters / CHET_MILLIMETERS)
                dessiatinText = format(value: millimeters / DESSIATIN_MILLIMETERS)
                millimeterText = format(value: millimeters)
                centimeterText = format(value: millimeters / CENTIMETER_MILLIMETERS)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                hectareText = format(value: millimeters / HECTARE_MILLIMETERS)
            
            case .millimeter:
                let millimeters = value
                
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                osminnikText = format(value: millimeters / OSMINNIK_MILLIMETERS)
                chetText = format(value: millimeters / CHET_MILLIMETERS)
                dessiatinText = format(value: millimeters / DESSIATIN_MILLIMETERS)
                verstText = format(value: millimeters / VERST_MILLIMETERS)
                centimeterText = format(value: millimeters / CENTIMETER_MILLIMETERS)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                hectareText = format(value: millimeters / HECTARE_MILLIMETERS)
            
            case .centimeter:
                let millimeters = value * CENTIMETER_MILLIMETERS
                
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                osminnikText = format(value: millimeters / OSMINNIK_MILLIMETERS)
                chetText = format(value: millimeters / CHET_MILLIMETERS)
                dessiatinText = format(value: millimeters / DESSIATIN_MILLIMETERS)
                verstText = format(value: millimeters / VERST_MILLIMETERS)
                millimeterText = format(value: millimeters)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                hectareText = format(value: millimeters / HECTARE_MILLIMETERS)
                
            case .meter:
                let millimeters = value * METER_MILLIMETERS
                
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                osminnikText = format(value: millimeters / OSMINNIK_MILLIMETERS)
                chetText = format(value: millimeters / CHET_MILLIMETERS)
                dessiatinText = format(value: millimeters / DESSIATIN_MILLIMETERS)
                verstText = format(value: millimeters / VERST_MILLIMETERS)
                millimeterText = format(value: millimeters)
                centimeterText = format(value: millimeters / CENTIMETER_MILLIMETERS)
                hectareText = format(value: millimeters / HECTARE_MILLIMETERS)
                
            case .hectare:
                let millimeters = value * HECTARE_MILLIMETERS
                
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                osminnikText = format(value: millimeters / OSMINNIK_MILLIMETERS)
                chetText = format(value: millimeters / CHET_MILLIMETERS)
                dessiatinText = format(value: millimeters / DESSIATIN_MILLIMETERS)
                verstText = format(value: millimeters / VERST_MILLIMETERS)
                millimeterText = format(value: millimeters)
                centimeterText = format(value: millimeters / CENTIMETER_MILLIMETERS)
                meterText = format(value: millimeters / METER_MILLIMETERS)
        }
    }
    
    private func clearAllValues() {
        lineText = ""
        inchText = ""
        vershokText = ""
        footText = ""
        arshinText = ""
        fathomText = ""
        osminnikText = ""
        chetText = ""
        dessiatinText = ""
        verstText = ""
        millimeterText = ""
        centimeterText = ""
        meterText = ""
        hectareText = ""
    }
    
    private func format(value: Double) -> String {
        formatter.string(from: NSNumber(value: value)) ?? ""
    }
}

