//
//  PharmaceuticalMeasure.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 10.09.2022.
//

import Foundation

class PharmaceuticalMeasure: Measure {
    var kind: PharmaceuticalMeasureKind = .gran
    
    init(value: String, kind: PharmaceuticalMeasureKind) {
        super.init(value: value)
        
        self.kind = kind
    }
}

enum PharmaceuticalMeasureKind {
    case gran
    case scruple
    case drachma
    case ounce
    case pound
    case milligram
    case gram
}
