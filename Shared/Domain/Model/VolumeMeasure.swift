//
//  VolumeMeasure.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 28.08.2022.
//

import Foundation

class VolumeMeasure: Measure {
    var kind: VolumeMeasuresKind = .line
    
    init(value: String, kind: VolumeMeasuresKind) {
        super.init(value: value)
        
        self.kind = kind
    }
}

enum VolumeMeasuresKind {
    case line
    case inch
    case vershok
    case foot
    case arshin
    case fathom
    case millimeter
    case centimeter
    case meter
}
