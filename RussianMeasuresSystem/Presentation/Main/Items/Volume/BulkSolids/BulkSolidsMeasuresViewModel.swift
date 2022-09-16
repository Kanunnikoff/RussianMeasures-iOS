//
//  BulkSolidsMeasuresViewModel.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 03.09.2022.
//

import Foundation

class BulkSolidsMeasuresViewModel: ObservableObject {
    
    private let GLASS_LITERS = 0.273
    private let HALF_HALF_HALF_SMALL_QUADRUPLE_LITERS = 0.41
    private let HALF_HALF_SMALL_QUADRUPLE_LITERS = 0.82
    private let SEMI_GARNET_LITERS = 1.64
    private let GARNETS_LITERS = 3.2798
    private let FOUR_LITERS = 6.56
    private let HALF_QUAD_LITERS = 13.12
    private let QUAD_LITERS = 26.2387
    private let POLOSMINA_LITERS = 52.48
    private let OSMINA_LITERS = 104.95
    private let QUARTER_LITERS = 209.9072
    private let POLOKOVA_LITERS = 419.84
    private let TUB_LITERS = 839.69
    private let CEBRA_LITERS = 5_457.5872
    
    @Published var glassText: String = ""
    @Published var halfHalfHalfSmallQuadrupleText: String = ""
    @Published var halfHalfSmallQuadrupleText: String = ""
    @Published var semiGarnetText: String = ""
    @Published var garnetsText: String = ""
    @Published var fourText: String = ""
    @Published var halfQuadText: String = ""
    @Published var quadText: String = ""
    @Published var polosminaText: String = ""
    @Published var osminaText: String = ""
    @Published var quarterText: String = ""
    @Published var polokovaText: String = ""
    @Published var tubText: String = ""
    @Published var cebraText: String = ""
    @Published var literText: String = ""
    
    func convert(measure: BulkSolidsMeasure) {
        guard let value = try? Double(measure.value, format: .localizedDouble(locale: Locale.current)) else {
            clearAllValues()
            return
        }
        
        switch measure.kind {
            case .glass:
                let liters = value * GLASS_LITERS
                
                halfHalfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_HALF_SMALL_QUADRUPLE_LITERS)
                halfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_SMALL_QUADRUPLE_LITERS)
                semiGarnetText = Util.format(value: liters / SEMI_GARNET_LITERS)
                garnetsText = Util.format(value: liters / GARNETS_LITERS)
                fourText = Util.format(value: liters / FOUR_LITERS)
                halfQuadText = Util.format(value: liters / HALF_QUAD_LITERS)
                quadText = Util.format(value: liters / QUAD_LITERS)
                polosminaText = Util.format(value: liters / POLOSMINA_LITERS)
                osminaText = Util.format(value: liters / OSMINA_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                polokovaText = Util.format(value: liters / POLOKOVA_LITERS)
                tubText = Util.format(value: liters / TUB_LITERS)
                cebraText = Util.format(value: liters / CEBRA_LITERS)
                literText = Util.format(value: liters)
                
            case .halfHalfHalfSmallQuadruple:
                let liters = value * HALF_HALF_HALF_SMALL_QUADRUPLE_LITERS
                
                glassText = Util.format(value: liters / GLASS_LITERS)
                halfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_SMALL_QUADRUPLE_LITERS)
                semiGarnetText = Util.format(value: liters / SEMI_GARNET_LITERS)
                garnetsText = Util.format(value: liters / GARNETS_LITERS)
                fourText = Util.format(value: liters / FOUR_LITERS)
                halfQuadText = Util.format(value: liters / HALF_QUAD_LITERS)
                quadText = Util.format(value: liters / QUAD_LITERS)
                polosminaText = Util.format(value: liters / POLOSMINA_LITERS)
                osminaText = Util.format(value: liters / OSMINA_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                polokovaText = Util.format(value: liters / POLOKOVA_LITERS)
                tubText = Util.format(value: liters / TUB_LITERS)
                cebraText = Util.format(value: liters / CEBRA_LITERS)
                literText = Util.format(value: liters)
                
            case .halfHalfSmallQuadruple:
                let liters = value * HALF_HALF_SMALL_QUADRUPLE_LITERS
                
                glassText = Util.format(value: liters / GLASS_LITERS)
                halfHalfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_HALF_SMALL_QUADRUPLE_LITERS)
                semiGarnetText = Util.format(value: liters / SEMI_GARNET_LITERS)
                garnetsText = Util.format(value: liters / GARNETS_LITERS)
                fourText = Util.format(value: liters / FOUR_LITERS)
                halfQuadText = Util.format(value: liters / HALF_QUAD_LITERS)
                quadText = Util.format(value: liters / QUAD_LITERS)
                polosminaText = Util.format(value: liters / POLOSMINA_LITERS)
                osminaText = Util.format(value: liters / OSMINA_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                polokovaText = Util.format(value: liters / POLOKOVA_LITERS)
                tubText = Util.format(value: liters / TUB_LITERS)
                cebraText = Util.format(value: liters / CEBRA_LITERS)
                literText = Util.format(value: liters)
                
            case .semiGarnet:
                let liters = value * SEMI_GARNET_LITERS
                
                glassText = Util.format(value: liters / GLASS_LITERS)
                halfHalfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_HALF_SMALL_QUADRUPLE_LITERS)
                halfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_SMALL_QUADRUPLE_LITERS)
                garnetsText = Util.format(value: liters / GARNETS_LITERS)
                fourText = Util.format(value: liters / FOUR_LITERS)
                halfQuadText = Util.format(value: liters / HALF_QUAD_LITERS)
                quadText = Util.format(value: liters / QUAD_LITERS)
                polosminaText = Util.format(value: liters / POLOSMINA_LITERS)
                osminaText = Util.format(value: liters / OSMINA_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                polokovaText = Util.format(value: liters / POLOKOVA_LITERS)
                tubText = Util.format(value: liters / TUB_LITERS)
                cebraText = Util.format(value: liters / CEBRA_LITERS)
                literText = Util.format(value: liters)
                
            case .garnets:
                let liters = value * GARNETS_LITERS
                
                glassText = Util.format(value: liters / GLASS_LITERS)
                halfHalfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_HALF_SMALL_QUADRUPLE_LITERS)
                halfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_SMALL_QUADRUPLE_LITERS)
                semiGarnetText = Util.format(value: liters / SEMI_GARNET_LITERS)
                fourText = Util.format(value: liters / FOUR_LITERS)
                halfQuadText = Util.format(value: liters / HALF_QUAD_LITERS)
                quadText = Util.format(value: liters / QUAD_LITERS)
                polosminaText = Util.format(value: liters / POLOSMINA_LITERS)
                osminaText = Util.format(value: liters / OSMINA_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                polokovaText = Util.format(value: liters / POLOKOVA_LITERS)
                tubText = Util.format(value: liters / TUB_LITERS)
                cebraText = Util.format(value: liters / CEBRA_LITERS)
                literText = Util.format(value: liters)
                
            case .four:
                let liters = value * FOUR_LITERS
                
                glassText = Util.format(value: liters / GLASS_LITERS)
                halfHalfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_HALF_SMALL_QUADRUPLE_LITERS)
                halfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_SMALL_QUADRUPLE_LITERS)
                semiGarnetText = Util.format(value: liters / SEMI_GARNET_LITERS)
                garnetsText = Util.format(value: liters / GARNETS_LITERS)
                halfQuadText = Util.format(value: liters / HALF_QUAD_LITERS)
                quadText = Util.format(value: liters / QUAD_LITERS)
                polosminaText = Util.format(value: liters / POLOSMINA_LITERS)
                osminaText = Util.format(value: liters / OSMINA_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                polokovaText = Util.format(value: liters / POLOKOVA_LITERS)
                tubText = Util.format(value: liters / TUB_LITERS)
                cebraText = Util.format(value: liters / CEBRA_LITERS)
                literText = Util.format(value: liters)
                
            case .halfQuad:
                let liters = value * HALF_QUAD_LITERS
                
                glassText = Util.format(value: liters / GLASS_LITERS)
                halfHalfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_HALF_SMALL_QUADRUPLE_LITERS)
                halfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_SMALL_QUADRUPLE_LITERS)
                semiGarnetText = Util.format(value: liters / SEMI_GARNET_LITERS)
                garnetsText = Util.format(value: liters / GARNETS_LITERS)
                fourText = Util.format(value: liters / FOUR_LITERS)
                quadText = Util.format(value: liters / QUAD_LITERS)
                polosminaText = Util.format(value: liters / POLOSMINA_LITERS)
                osminaText = Util.format(value: liters / OSMINA_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                polokovaText = Util.format(value: liters / POLOKOVA_LITERS)
                tubText = Util.format(value: liters / TUB_LITERS)
                cebraText = Util.format(value: liters / CEBRA_LITERS)
                literText = Util.format(value: liters)
                
            case .quad:
                let liters = value * QUAD_LITERS
                
                glassText = Util.format(value: liters / GLASS_LITERS)
                halfHalfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_HALF_SMALL_QUADRUPLE_LITERS)
                halfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_SMALL_QUADRUPLE_LITERS)
                semiGarnetText = Util.format(value: liters / SEMI_GARNET_LITERS)
                garnetsText = Util.format(value: liters / GARNETS_LITERS)
                fourText = Util.format(value: liters / FOUR_LITERS)
                halfQuadText = Util.format(value: liters / HALF_QUAD_LITERS)
                polosminaText = Util.format(value: liters / POLOSMINA_LITERS)
                osminaText = Util.format(value: liters / OSMINA_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                polokovaText = Util.format(value: liters / POLOKOVA_LITERS)
                tubText = Util.format(value: liters / TUB_LITERS)
                cebraText = Util.format(value: liters / CEBRA_LITERS)
                literText = Util.format(value: liters)
                
            case .polosmina:
                let liters = value * POLOSMINA_LITERS
                
                glassText = Util.format(value: liters / GLASS_LITERS)
                halfHalfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_HALF_SMALL_QUADRUPLE_LITERS)
                halfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_SMALL_QUADRUPLE_LITERS)
                semiGarnetText = Util.format(value: liters / SEMI_GARNET_LITERS)
                garnetsText = Util.format(value: liters / GARNETS_LITERS)
                fourText = Util.format(value: liters / FOUR_LITERS)
                halfQuadText = Util.format(value: liters / HALF_QUAD_LITERS)
                quadText = Util.format(value: liters / QUAD_LITERS)
                osminaText = Util.format(value: liters / OSMINA_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                polokovaText = Util.format(value: liters / POLOKOVA_LITERS)
                tubText = Util.format(value: liters / TUB_LITERS)
                cebraText = Util.format(value: liters / CEBRA_LITERS)
                literText = Util.format(value: liters)
                
            case .osmina:
                let liters = value * OSMINA_LITERS
                
                glassText = Util.format(value: liters / GLASS_LITERS)
                halfHalfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_HALF_SMALL_QUADRUPLE_LITERS)
                halfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_SMALL_QUADRUPLE_LITERS)
                semiGarnetText = Util.format(value: liters / SEMI_GARNET_LITERS)
                garnetsText = Util.format(value: liters / GARNETS_LITERS)
                fourText = Util.format(value: liters / FOUR_LITERS)
                halfQuadText = Util.format(value: liters / HALF_QUAD_LITERS)
                quadText = Util.format(value: liters / QUAD_LITERS)
                polosminaText = Util.format(value: liters / POLOSMINA_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                polokovaText = Util.format(value: liters / POLOKOVA_LITERS)
                tubText = Util.format(value: liters / TUB_LITERS)
                cebraText = Util.format(value: liters / CEBRA_LITERS)
                literText = Util.format(value: liters)
                
            case .quarter:
                let liters = value * QUARTER_LITERS
                
                glassText = Util.format(value: liters / GLASS_LITERS)
                halfHalfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_HALF_SMALL_QUADRUPLE_LITERS)
                halfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_SMALL_QUADRUPLE_LITERS)
                semiGarnetText = Util.format(value: liters / SEMI_GARNET_LITERS)
                garnetsText = Util.format(value: liters / GARNETS_LITERS)
                fourText = Util.format(value: liters / FOUR_LITERS)
                halfQuadText = Util.format(value: liters / HALF_QUAD_LITERS)
                quadText = Util.format(value: liters / QUAD_LITERS)
                polosminaText = Util.format(value: liters / POLOSMINA_LITERS)
                osminaText = Util.format(value: liters / OSMINA_LITERS)
                polokovaText = Util.format(value: liters / POLOKOVA_LITERS)
                tubText = Util.format(value: liters / TUB_LITERS)
                cebraText = Util.format(value: liters / CEBRA_LITERS)
                literText = Util.format(value: liters)
                
            case .polokova:
                let liters = value * POLOKOVA_LITERS
                
                glassText = Util.format(value: liters / GLASS_LITERS)
                halfHalfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_HALF_SMALL_QUADRUPLE_LITERS)
                halfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_SMALL_QUADRUPLE_LITERS)
                semiGarnetText = Util.format(value: liters / SEMI_GARNET_LITERS)
                garnetsText = Util.format(value: liters / GARNETS_LITERS)
                fourText = Util.format(value: liters / FOUR_LITERS)
                halfQuadText = Util.format(value: liters / HALF_QUAD_LITERS)
                quadText = Util.format(value: liters / QUAD_LITERS)
                polosminaText = Util.format(value: liters / POLOSMINA_LITERS)
                osminaText = Util.format(value: liters / OSMINA_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                tubText = Util.format(value: liters / TUB_LITERS)
                cebraText = Util.format(value: liters / CEBRA_LITERS)
                literText = Util.format(value: liters)
                
            case .tub:
                let liters = value * TUB_LITERS
                
                glassText = Util.format(value: liters / GLASS_LITERS)
                halfHalfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_HALF_SMALL_QUADRUPLE_LITERS)
                halfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_SMALL_QUADRUPLE_LITERS)
                semiGarnetText = Util.format(value: liters / SEMI_GARNET_LITERS)
                garnetsText = Util.format(value: liters / GARNETS_LITERS)
                fourText = Util.format(value: liters / FOUR_LITERS)
                halfQuadText = Util.format(value: liters / HALF_QUAD_LITERS)
                quadText = Util.format(value: liters / QUAD_LITERS)
                polosminaText = Util.format(value: liters / POLOSMINA_LITERS)
                osminaText = Util.format(value: liters / OSMINA_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                polokovaText = Util.format(value: liters / POLOKOVA_LITERS)
                cebraText = Util.format(value: liters / CEBRA_LITERS)
                literText = Util.format(value: liters)
                
            case .cebra:
                let liters = value * CEBRA_LITERS
                
                glassText = Util.format(value: liters / GLASS_LITERS)
                halfHalfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_HALF_SMALL_QUADRUPLE_LITERS)
                halfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_SMALL_QUADRUPLE_LITERS)
                semiGarnetText = Util.format(value: liters / SEMI_GARNET_LITERS)
                garnetsText = Util.format(value: liters / GARNETS_LITERS)
                fourText = Util.format(value: liters / FOUR_LITERS)
                halfQuadText = Util.format(value: liters / HALF_QUAD_LITERS)
                quadText = Util.format(value: liters / QUAD_LITERS)
                polosminaText = Util.format(value: liters / POLOSMINA_LITERS)
                osminaText = Util.format(value: liters / OSMINA_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                polokovaText = Util.format(value: liters / POLOKOVA_LITERS)
                tubText = Util.format(value: liters / TUB_LITERS)
                literText = Util.format(value: liters)
                
            case .liter:
                let liters = value
                
                glassText = Util.format(value: liters / GLASS_LITERS)
                halfHalfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_HALF_SMALL_QUADRUPLE_LITERS)
                halfHalfSmallQuadrupleText = Util.format(value: liters / HALF_HALF_SMALL_QUADRUPLE_LITERS)
                semiGarnetText = Util.format(value: liters / SEMI_GARNET_LITERS)
                garnetsText = Util.format(value: liters / GARNETS_LITERS)
                fourText = Util.format(value: liters / FOUR_LITERS)
                halfQuadText = Util.format(value: liters / HALF_QUAD_LITERS)
                quadText = Util.format(value: liters / QUAD_LITERS)
                polosminaText = Util.format(value: liters / POLOSMINA_LITERS)
                osminaText = Util.format(value: liters / OSMINA_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                polokovaText = Util.format(value: liters / POLOKOVA_LITERS)
                tubText = Util.format(value: liters / TUB_LITERS)
                cebraText = Util.format(value: liters / CEBRA_LITERS)
        }
    }
    
    private func clearAllValues() {
        glassText = ""
        halfHalfHalfSmallQuadrupleText = ""
        halfHalfSmallQuadrupleText = ""
        semiGarnetText = ""
        garnetsText = ""
        fourText = ""
        halfQuadText = ""
        quadText = ""
        polosminaText = ""
        osminaText = ""
        quarterText = ""
        polokovaText = ""
        tubText = ""
        cebraText = ""
        literText = ""
    }
}
