//
//  LengthMeasureKind.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 21.08.2022.
//

import Foundation

class LengthMeasure: Measure {
    var kind: LengthMeasuresKind = .dot
    
    init(value: String, kind: LengthMeasuresKind) {
        super.init(value: value)
        
        self.kind = kind
    }
}

enum LengthMeasuresKind {
    case dot
    case line
    case weaving
    case inch
    case vershok
    case quarter
    case foot
    case arshin
    case fathom
    case verst
    case millimeter
    case meter
}
