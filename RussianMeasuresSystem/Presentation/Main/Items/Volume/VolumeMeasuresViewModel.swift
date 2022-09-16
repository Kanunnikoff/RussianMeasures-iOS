//
//  VolumeMeasuresViewModel.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 28.08.2022.
//

import Foundation

class VolumeMeasuresViewModel: ObservableObject {
    
    private let LINE_MILLIMETERS = 16.3871
    private let INCH_MILLIMETERS = 16_387.1
    private let VERSHOK_MILLIMETERS = 87_824.4
    private let FOOT_MILLIMETERS = 28_316_800.0
    private let ARSHIN_MILLIMETERS = 359_728_800.0
    private let FATHOM_MILLIMETERS = 9_712_700_000.0
    private let CENTIMETER_MILLIMETERS = 1_000.0
    private let METER_MILLIMETERS = 1_000_000_000.0
    
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
    @Published var millimeterText: String = ""
    @Published var centimeterText: String = ""
    @Published var meterText: String = ""
    
    func convert(measure: VolumeMeasure) {
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
                millimeterText = format(value: millimeters)
                centimeterText = format(value: millimeters / CENTIMETER_MILLIMETERS)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                
            case .inch:
                let millimeters = value * INCH_MILLIMETERS
                
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                millimeterText = format(value: millimeters)
                centimeterText = format(value: millimeters / CENTIMETER_MILLIMETERS)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                
            case .vershok:
                let millimeters = value * VERSHOK_MILLIMETERS
                
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                millimeterText = format(value: millimeters)
                centimeterText = format(value: millimeters / CENTIMETER_MILLIMETERS)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                
            case .foot:
                let millimeters = value * FOOT_MILLIMETERS
                
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                millimeterText = format(value: millimeters)
                centimeterText = format(value: millimeters / CENTIMETER_MILLIMETERS)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                
            case .arshin:
                let millimeters = value * ARSHIN_MILLIMETERS
                
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                millimeterText = format(value: millimeters)
                centimeterText = format(value: millimeters / CENTIMETER_MILLIMETERS)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                
            case .fathom:
                let millimeters = value * FATHOM_MILLIMETERS
                
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                millimeterText = format(value: millimeters)
                centimeterText = format(value: millimeters / CENTIMETER_MILLIMETERS)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                
            case .millimeter:
                let millimeters = value
                
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                centimeterText = format(value: millimeters / CENTIMETER_MILLIMETERS)
                meterText = format(value: millimeters / METER_MILLIMETERS)
                
            case .centimeter:
                let millimeters = value * CENTIMETER_MILLIMETERS
                
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                millimeterText = format(value: millimeters)
                meterText = format(value: millimeters / METER_MILLIMETERS)
            
            case .meter:
                let millimeters = value * METER_MILLIMETERS
                
                lineText = format(value: millimeters / LINE_MILLIMETERS)
                inchText = format(value: millimeters / INCH_MILLIMETERS)
                vershokText = format(value: millimeters / VERSHOK_MILLIMETERS)
                footText = format(value: millimeters / FOOT_MILLIMETERS)
                arshinText = format(value: millimeters / ARSHIN_MILLIMETERS)
                fathomText = format(value: millimeters / FATHOM_MILLIMETERS)
                millimeterText = format(value: millimeters)
                centimeterText = format(value: millimeters / CENTIMETER_MILLIMETERS)
        }
    }
    
    private func clearAllValues() {
        lineText = ""
        inchText = ""
        vershokText = ""
        footText = ""
        arshinText = ""
        fathomText = ""
        millimeterText = ""
        centimeterText = ""
        meterText = ""
    }
    
    private func format(value: Double) -> String {
        formatter.string(from: NSNumber(value: value)) ?? ""
    }
}
