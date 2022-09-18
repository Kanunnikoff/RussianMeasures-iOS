//
//  MeasuresItemDetails.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 21.08.2022.
//

import SwiftUI

struct MeasuresItemDetails: View {
    
    let item: MeasuresItem
    
    var body: some View {
        switch item {
            case .length:
                LengthMeasuresView()
            case .square:
                SquareMeasuresView()
            case .volume:
                VolumeMeasuresView()
            case .bulkSolids:
                BulkSolidsMeasuresView()
            case .liquidBodies:
                LiquidBodiesMeasuresView()
            case .weight:
                WeightMeasuresView()
            case .pharmaceutical:
                PharmaceuticalMeasuresView()
            case .pieceItems:
                PieceItemsMeasuresView()
        }
    }
}

struct MeasuresItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        MeasuresItemDetails(item: MeasuresItem.length)
    }
}
