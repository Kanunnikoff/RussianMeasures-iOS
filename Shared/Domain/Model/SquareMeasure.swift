//
//  SquareMeasure.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 28.08.2022.
//

import Foundation

class SquareMeasure: Measure {
    var kind: SquareMeasuresKind = .line
    
    init(value: String, kind: SquareMeasuresKind) {
        super.init(value: value)
        
        self.kind = kind
    }
}

enum SquareMeasuresKind {
    case line
    case inch
    case vershok
    case foot
    case arshin
    case fathom
    case osminnik
    case chet
    case dessiatin
    case verst
    case millimeter
    case centimeter
    case meter
    case hectare
}
