//
//  PieceItemsMeasure.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 10.09.2022.
//

import Foundation

class PieceItemsMeasure: Measure {
    var kind: PieceItemsMeasureKind = .pair
    
    init(value: String, kind: PieceItemsMeasureKind) {
        super.init(value: value)
        
        self.kind = kind
    }
}

enum PieceItemsMeasureKind {
    case pair
    case dozen
    case gross
    case mass
    case piece
}
