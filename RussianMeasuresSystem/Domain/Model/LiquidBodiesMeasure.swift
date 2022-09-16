//
//  LiquidBodiesMeasure.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 04.09.2022.
//

import Foundation

class LiquidBodiesMeasure: Measure {
    var kind: LiquidBodiesMeasureKind = .scale
    
    init(value: String, kind: LiquidBodiesMeasureKind) {
        super.init(value: value)
        
        self.kind = kind
    }
}

enum LiquidBodiesMeasureKind {
    case scale
    case cup
    case chetushka
    case glass
    case pigtail
    case vodkaBottle
    case wineBottle
    case damask
    case octagonalDamask
    case garnet
    case quarter
    case bucket
    case korchaga
    case barrel
    case liter
}
