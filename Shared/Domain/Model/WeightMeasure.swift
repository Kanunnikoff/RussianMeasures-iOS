//
//  WeightMeasure.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 04.09.2022.
//

import Foundation

class WeightMeasure: Measure {
    var kind: WeightMeasureKind = .share
    
    init(value: String, kind: WeightMeasureKind) {
        super.init(value: value)
        
        self.kind = kind
    }
}

enum WeightMeasureKind {
    case share
    case bud
    case spool
    case lot
    case pound
    case pud
    case berkovets
    case gram
    case kilogram
}
