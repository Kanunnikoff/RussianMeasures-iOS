//
//  PieceItemsMeasuresViewModel.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 10.09.2022.
//

import Foundation

class PieceItemsMeasuresViewModel: ObservableObject {
    
    private let PAIR_PIECES = 2.0
    private let DOZEN_PIECES = 12.0
    private let GROSS_PIECES = 144.0
    private let MASS_PIECES = 1_728.0
    
    @Published var pairText: String = ""
    @Published var dozenText: String = ""
    @Published var grossText: String = ""
    @Published var massText: String = ""
    @Published var pieceText: String = ""
    
    func convert(measure: PieceItemsMeasure) {
        guard let value = try? Double(measure.value, format: .localizedDouble(locale: Locale.current)) else {
            clearAllValues()
            return
        }
        
        switch measure.kind {
            case .pair:
                let pieces = value * PAIR_PIECES
                
                dozenText = Util.format(value: pieces / DOZEN_PIECES)
                grossText = Util.format(value: pieces / GROSS_PIECES)
                massText = Util.format(value: pieces / MASS_PIECES)
                pieceText = Util.format(value: pieces)
                
            case .dozen:
                let pieces = value * DOZEN_PIECES
                
                pairText = Util.format(value: pieces / PAIR_PIECES)
                grossText = Util.format(value: pieces / GROSS_PIECES)
                massText = Util.format(value: pieces / MASS_PIECES)
                pieceText = Util.format(value: pieces)
                
            case .gross:
                let pieces = value * GROSS_PIECES
                
                pairText = Util.format(value: pieces / PAIR_PIECES)
                dozenText = Util.format(value: pieces / DOZEN_PIECES)
                massText = Util.format(value: pieces / MASS_PIECES)
                pieceText = Util.format(value: pieces)
                
            case .mass:
                let pieces = value * MASS_PIECES
                
                pairText = Util.format(value: pieces / PAIR_PIECES)
                dozenText = Util.format(value: pieces / DOZEN_PIECES)
                grossText = Util.format(value: pieces / GROSS_PIECES)
                pieceText = Util.format(value: pieces)
                
            case .piece:
                let pieces = value
                
                pairText = Util.format(value: pieces / PAIR_PIECES)
                dozenText = Util.format(value: pieces / DOZEN_PIECES)
                grossText = Util.format(value: pieces / GROSS_PIECES)
                massText = Util.format(value: pieces / MASS_PIECES)
        }
    }
    
    private func clearAllValues() {
        pairText = ""
        dozenText = ""
        grossText = ""
        massText = ""
        pieceText = ""
    }
}
