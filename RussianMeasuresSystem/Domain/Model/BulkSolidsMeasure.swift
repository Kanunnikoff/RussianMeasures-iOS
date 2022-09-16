//
//  BulkSolidsMeasures.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 03.09.2022.
//

import Foundation

class BulkSolidsMeasure: Measure {
    var kind: BulkSolidsMeasuresKind = .glass
    
    init(value: String, kind: BulkSolidsMeasuresKind) {
        super.init(value: value)
        
        self.kind = kind
    }
}

enum BulkSolidsMeasuresKind {
    case glass
    case halfHalfHalfSmallQuadruple
    case halfHalfSmallQuadruple
    case semiGarnet
    case garnets
    case four
    case halfQuad
    case quad
    case polosmina
    case osmina
    case quarter
    case polokova
    case tub
    case cebra
    case liter
}
