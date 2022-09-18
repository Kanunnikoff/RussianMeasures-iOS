//
//  LengthMeasuresViewModel.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 21.08.2022.
//

import Foundation

class LengthMeasuresViewModel: ObservableObject {
    
    private let DOT_MILLIMETERS = 0.254
    private let LINE_MILLIMETERS = 2.54
    private let WEAVING_MILLIMETERS = 21.336
    private let INCH_MILLIMETERS = 25.4
    private let VERSHOK_MILLIMETERS = 44.45
    private let QUARTER_MILLIMETERS = 177.8
    private let FOOT_MILLIMETERS = 304.8
    private let ARSHIN_MILLIMETERS = 711.2
    private let FATHOM_MILLIMETERS = 2_133.6
    private let VERST_MILLIMETERS = 1_066_800.0
    private let METER_MILLIMETERS = 1_000.0
    
    private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 6
        formatter.groupingSeparator = " "
        
        return formatter
    }()
    
    @Published var dotText: String = ""
    @Published var lineText: String = ""
    @Published var weavingText: String = ""
    @Published var inchText: String = ""
    @Published var vershokText: String = ""
    @Published var quarterText: String = ""
    @Published var footText: String = ""
    @Published var arshinText: String = ""
    @Published var fathomText: String = ""
    @Published var verstText: String = ""
    @Published var millimeterText: String = ""
    @Published var meterText: String = ""
    
    func convert(measure: LengthMeasure) {
        guard let value = try? Double(measure.value, format: .localizedDouble(locale: Locale.current)) else {
            clearAllValues()
            return
        }
        
        switch measure.kind {
            case .dot:
                let millimeters = value * DOT_MILLIMETERS
                
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                weavingText = format(value: millimeters / WEAVING_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                quarterText = format(value: millimeters / QUARTER_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                verstText = format(value: millimeters / VERST_MILLIMETERS)
                millimeterText = format(value: millimeters)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                
            case .line:
                let millimeters = value * LINE_MILLIMETERS
                
                dotText = format(value: millimeters / DOT_MILLIMETERS)
                weavingText = format(value: millimeters / WEAVING_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                quarterText = format(value: millimeters / QUARTER_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                verstText = format(value: millimeters / VERST_MILLIMETERS)
                millimeterText = format(value: millimeters)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                
            case .weaving:
                let millimeters = value * WEAVING_MILLIMETERS
                
                dotText = format(value: millimeters / DOT_MILLIMETERS)
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                quarterText = format(value: millimeters / QUARTER_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                verstText = format(value: millimeters / VERST_MILLIMETERS)
                millimeterText = format(value: millimeters)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                
            case .inch:
                let millimeters = value * INCH_MILLIMETERS
                
                dotText = format(value: millimeters / DOT_MILLIMETERS)
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                weavingText = format(value: millimeters / WEAVING_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                quarterText = format(value: millimeters / QUARTER_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                verstText = format(value: millimeters / VERST_MILLIMETERS)
                millimeterText = format(value: millimeters)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                
            case .vershok:
                let millimeters = value * VERSHOK_MILLIMETERS
                
                dotText = format(value: millimeters / DOT_MILLIMETERS)
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                weavingText = format(value: millimeters / WEAVING_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                quarterText = format(value: millimeters / QUARTER_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                verstText = format(value: millimeters / VERST_MILLIMETERS)
                millimeterText = format(value: millimeters)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                
            case .quarter:
                let millimeters = value * QUARTER_MILLIMETERS
                
                dotText = format(value: millimeters / DOT_MILLIMETERS)
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                weavingText = format(value: millimeters / WEAVING_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                verstText = format(value: millimeters / VERST_MILLIMETERS)
                millimeterText = format(value: millimeters)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                
            case .foot:
                let millimeters = value * FOOT_MILLIMETERS
                
                dotText = format(value: millimeters / DOT_MILLIMETERS)
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                weavingText = format(value: millimeters / WEAVING_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                quarterText = format(value: millimeters / QUARTER_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                verstText = format(value: millimeters / VERST_MILLIMETERS)
                millimeterText = format(value: millimeters)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                
            case .arshin:
                let millimeters = value * ARSHIN_MILLIMETERS
                
                dotText = format(value: millimeters / DOT_MILLIMETERS)
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                weavingText = format(value: millimeters / WEAVING_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                quarterText = format(value: millimeters / QUARTER_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                verstText = format(value: millimeters / VERST_MILLIMETERS)
                millimeterText = format(value: millimeters)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                
            case .fathom:
                let millimeters = value * FATHOM_MILLIMETERS
                
                dotText = format(value: millimeters / DOT_MILLIMETERS)
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                weavingText = format(value: millimeters / WEAVING_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                quarterText = format(value: millimeters / QUARTER_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                verstText = format(value: millimeters / VERST_MILLIMETERS)
                millimeterText = format(value: millimeters)
                meterText = format(value: millimeters / METER_MILLIMETERS)
            
            case .verst:
                let millimeters = value * VERST_MILLIMETERS
                
                dotText = format(value: millimeters / DOT_MILLIMETERS)
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                weavingText = format(value: millimeters / WEAVING_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                quarterText = format(value: millimeters / QUARTER_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                millimeterText = format(value: millimeters)
                meterText = format(value: millimeters / METER_MILLIMETERS)
            
            case .millimeter:
                let millimeters = value
                
                dotText = format(value: millimeters / DOT_MILLIMETERS)
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                weavingText = format(value: millimeters / WEAVING_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                quarterText = format(value: millimeters / QUARTER_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                verstText = format(value: millimeters / VERST_MILLIMETERS)
                meterText = format(value: millimeters / METER_MILLIMETERS)
            
            case .meter:
                let millimeters = value * METER_MILLIMETERS
                
                dotText = format(value: millimeters / DOT_MILLIMETERS)
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                weavingText = format(value: millimeters / WEAVING_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                quarterText = format(value: millimeters / QUARTER_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                verstText = format(value: millimeters / VERST_MILLIMETERS)
                millimeterText = format(value: millimeters)
        }
    }
    
    private func clearAllValues() {
        dotText = ""
        lineText = ""
        weavingText = ""
        inchText = ""
        vershokText = ""
        quarterText = ""
        footText = ""
        arshinText = ""
        fathomText = ""
        verstText = ""
        millimeterText = ""
        meterText = ""
    }
    
    private func format(value: Double) -> String {
        formatter.string(from: NSNumber(value: value)) ?? ""
    }
}
