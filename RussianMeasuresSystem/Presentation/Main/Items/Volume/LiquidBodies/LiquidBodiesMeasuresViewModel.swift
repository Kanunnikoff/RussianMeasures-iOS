//
//  LiquidBodiesMeasuresViewModel.swift
//  RussianMeasuresSystem
//
//  Created by Дмитрiй Канунниковъ on 04.09.2022.
//

import Foundation

class LiquidBodiesMeasuresViewModel: ObservableObject {
    
    private let SCALE_LITERS = 0.0615
    private let CUP_LITERS = 0.123
    private let CHETUSHKA_LITERS = 0.24598
    private let GLASS_LITERS = 0.273
    private let PIGTAIL_LITERS = 0.307475
    private let VODKA_BOTTLE_LITERS = 0.615
    private let WINE_BOTTLE_LITERS = 0.68
    private let DAMASK_LITERS = 1.2299
    private let OCTOGONAL_DAMASK_LITERS = 1.537375
    private let GARNET_LITERS = 3.276
    private let QUARTER_LITERS = 3.0748
    private let BUCKET_LITERS = 12.29941
    private let KORCHAGA_LITERS = 25.0
    private let BARREL_LITERS = 491.976
    
    @Published var scaleText: String = ""
    @Published var cupText: String = ""
    @Published var chetushkaText: String = ""
    @Published var glassText: String = ""
    @Published var pigtailText: String = ""
    @Published var vodkaBottleText: String = ""
    @Published var wineBottleText: String = ""
    @Published var damaskText: String = ""
    @Published var octagonalDamaskText: String = ""
    @Published var garnetText: String = ""
    @Published var quarterText: String = ""
    @Published var bucketText: String = ""
    @Published var korchagaText: String = ""
    @Published var barrelText: String = ""
    @Published var literText: String = ""
    
    func convert(measure: LiquidBodiesMeasure) {
        guard let value = try? Double(measure.value, format: .localizedDouble(locale: Locale.current)) else {
            clearAllValues()
            return
        }
        
        switch measure.kind {
            case .scale:
                let liters = value * SCALE_LITERS
                
                cupText = Util.format(value: liters / CUP_LITERS)
                chetushkaText = Util.format(value: liters / CHETUSHKA_LITERS)
                glassText = Util.format(value: liters / GLASS_LITERS)
                pigtailText = Util.format(value: liters / PIGTAIL_LITERS)
                vodkaBottleText = Util.format(value: liters / VODKA_BOTTLE_LITERS)
                wineBottleText = Util.format(value: liters / WINE_BOTTLE_LITERS)
                damaskText = Util.format(value: liters / DAMASK_LITERS)
                octagonalDamaskText = Util.format(value: liters / OCTOGONAL_DAMASK_LITERS)
                garnetText = Util.format(value: liters / GARNET_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                bucketText = Util.format(value: liters / BUCKET_LITERS)
                korchagaText = Util.format(value: liters / KORCHAGA_LITERS)
                barrelText = Util.format(value: liters / BARREL_LITERS)
                literText = Util.format(value: liters)
                
            case .cup:
                let liters = value * CUP_LITERS
                
                scaleText = Util.format(value: liters / SCALE_LITERS)
                chetushkaText = Util.format(value: liters / CHETUSHKA_LITERS)
                glassText = Util.format(value: liters / GLASS_LITERS)
                pigtailText = Util.format(value: liters / PIGTAIL_LITERS)
                vodkaBottleText = Util.format(value: liters / VODKA_BOTTLE_LITERS)
                wineBottleText = Util.format(value: liters / WINE_BOTTLE_LITERS)
                damaskText = Util.format(value: liters / DAMASK_LITERS)
                octagonalDamaskText = Util.format(value: liters / OCTOGONAL_DAMASK_LITERS)
                garnetText = Util.format(value: liters / GARNET_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                bucketText = Util.format(value: liters / BUCKET_LITERS)
                korchagaText = Util.format(value: liters / KORCHAGA_LITERS)
                barrelText = Util.format(value: liters / BARREL_LITERS)
                literText = Util.format(value: liters)
                
            case .chetushka:
                let liters = value * CHETUSHKA_LITERS
                
                scaleText = Util.format(value: liters / SCALE_LITERS)
                cupText = Util.format(value: liters / CUP_LITERS)
                glassText = Util.format(value: liters / GLASS_LITERS)
                pigtailText = Util.format(value: liters / PIGTAIL_LITERS)
                vodkaBottleText = Util.format(value: liters / VODKA_BOTTLE_LITERS)
                wineBottleText = Util.format(value: liters / WINE_BOTTLE_LITERS)
                damaskText = Util.format(value: liters / DAMASK_LITERS)
                octagonalDamaskText = Util.format(value: liters / OCTOGONAL_DAMASK_LITERS)
                garnetText = Util.format(value: liters / GARNET_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                bucketText = Util.format(value: liters / BUCKET_LITERS)
                korchagaText = Util.format(value: liters / KORCHAGA_LITERS)
                barrelText = Util.format(value: liters / BARREL_LITERS)
                literText = Util.format(value: liters)
                
            case .glass:
                let liters = value * GLASS_LITERS
                
                scaleText = Util.format(value: liters / SCALE_LITERS)
                cupText = Util.format(value: liters / CUP_LITERS)
                chetushkaText = Util.format(value: liters / CHETUSHKA_LITERS)
                pigtailText = Util.format(value: liters / PIGTAIL_LITERS)
                vodkaBottleText = Util.format(value: liters / VODKA_BOTTLE_LITERS)
                wineBottleText = Util.format(value: liters / WINE_BOTTLE_LITERS)
                damaskText = Util.format(value: liters / DAMASK_LITERS)
                octagonalDamaskText = Util.format(value: liters / OCTOGONAL_DAMASK_LITERS)
                garnetText = Util.format(value: liters / GARNET_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                bucketText = Util.format(value: liters / BUCKET_LITERS)
                korchagaText = Util.format(value: liters / KORCHAGA_LITERS)
                barrelText = Util.format(value: liters / BARREL_LITERS)
                literText = Util.format(value: liters)
                
            case .pigtail:
                let liters = value * PIGTAIL_LITERS
                
                scaleText = Util.format(value: liters / SCALE_LITERS)
                cupText = Util.format(value: liters / CUP_LITERS)
                chetushkaText = Util.format(value: liters / CHETUSHKA_LITERS)
                glassText = Util.format(value: liters / GLASS_LITERS)
                vodkaBottleText = Util.format(value: liters / VODKA_BOTTLE_LITERS)
                wineBottleText = Util.format(value: liters / WINE_BOTTLE_LITERS)
                damaskText = Util.format(value: liters / DAMASK_LITERS)
                octagonalDamaskText = Util.format(value: liters / OCTOGONAL_DAMASK_LITERS)
                garnetText = Util.format(value: liters / GARNET_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                bucketText = Util.format(value: liters / BUCKET_LITERS)
                korchagaText = Util.format(value: liters / KORCHAGA_LITERS)
                barrelText = Util.format(value: liters / BARREL_LITERS)
                literText = Util.format(value: liters)
                
            case .vodkaBottle:
                let liters = value * VODKA_BOTTLE_LITERS
                
                scaleText = Util.format(value: liters / SCALE_LITERS)
                cupText = Util.format(value: liters / CUP_LITERS)
                chetushkaText = Util.format(value: liters / CHETUSHKA_LITERS)
                glassText = Util.format(value: liters / GLASS_LITERS)
                pigtailText = Util.format(value: liters / PIGTAIL_LITERS)
                wineBottleText = Util.format(value: liters / WINE_BOTTLE_LITERS)
                damaskText = Util.format(value: liters / DAMASK_LITERS)
                octagonalDamaskText = Util.format(value: liters / OCTOGONAL_DAMASK_LITERS)
                garnetText = Util.format(value: liters / GARNET_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                bucketText = Util.format(value: liters / BUCKET_LITERS)
                korchagaText = Util.format(value: liters / KORCHAGA_LITERS)
                barrelText = Util.format(value: liters / BARREL_LITERS)
                literText = Util.format(value: liters)
                
            case .wineBottle:
                let liters = value * WINE_BOTTLE_LITERS
                
                scaleText = Util.format(value: liters / SCALE_LITERS)
                cupText = Util.format(value: liters / CUP_LITERS)
                chetushkaText = Util.format(value: liters / CHETUSHKA_LITERS)
                glassText = Util.format(value: liters / GLASS_LITERS)
                pigtailText = Util.format(value: liters / PIGTAIL_LITERS)
                vodkaBottleText = Util.format(value: liters / VODKA_BOTTLE_LITERS)
                damaskText = Util.format(value: liters / DAMASK_LITERS)
                octagonalDamaskText = Util.format(value: liters / OCTOGONAL_DAMASK_LITERS)
                garnetText = Util.format(value: liters / GARNET_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                bucketText = Util.format(value: liters / BUCKET_LITERS)
                korchagaText = Util.format(value: liters / KORCHAGA_LITERS)
                barrelText = Util.format(value: liters / BARREL_LITERS)
                literText = Util.format(value: liters)
                
            case .damask:
                let liters = value * DAMASK_LITERS
                
                scaleText = Util.format(value: liters / SCALE_LITERS)
                cupText = Util.format(value: liters / CUP_LITERS)
                chetushkaText = Util.format(value: liters / CHETUSHKA_LITERS)
                glassText = Util.format(value: liters / GLASS_LITERS)
                pigtailText = Util.format(value: liters / PIGTAIL_LITERS)
                vodkaBottleText = Util.format(value: liters / VODKA_BOTTLE_LITERS)
                wineBottleText = Util.format(value: liters / WINE_BOTTLE_LITERS)
                octagonalDamaskText = Util.format(value: liters / OCTOGONAL_DAMASK_LITERS)
                garnetText = Util.format(value: liters / GARNET_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                bucketText = Util.format(value: liters / BUCKET_LITERS)
                korchagaText = Util.format(value: liters / KORCHAGA_LITERS)
                barrelText = Util.format(value: liters / BARREL_LITERS)
                literText = Util.format(value: liters)
                
            case .octagonalDamask:
                let liters = value * OCTOGONAL_DAMASK_LITERS
                
                scaleText = Util.format(value: liters / SCALE_LITERS)
                cupText = Util.format(value: liters / CUP_LITERS)
                chetushkaText = Util.format(value: liters / CHETUSHKA_LITERS)
                glassText = Util.format(value: liters / GLASS_LITERS)
                pigtailText = Util.format(value: liters / PIGTAIL_LITERS)
                vodkaBottleText = Util.format(value: liters / VODKA_BOTTLE_LITERS)
                wineBottleText = Util.format(value: liters / WINE_BOTTLE_LITERS)
                damaskText = Util.format(value: liters / DAMASK_LITERS)
                garnetText = Util.format(value: liters / GARNET_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                bucketText = Util.format(value: liters / BUCKET_LITERS)
                korchagaText = Util.format(value: liters / KORCHAGA_LITERS)
                barrelText = Util.format(value: liters / BARREL_LITERS)
                literText = Util.format(value: liters)
                
            case .garnet:
                let liters = value * GARNET_LITERS
                
                scaleText = Util.format(value: liters / SCALE_LITERS)
                cupText = Util.format(value: liters / CUP_LITERS)
                chetushkaText = Util.format(value: liters / CHETUSHKA_LITERS)
                glassText = Util.format(value: liters / GLASS_LITERS)
                pigtailText = Util.format(value: liters / PIGTAIL_LITERS)
                vodkaBottleText = Util.format(value: liters / VODKA_BOTTLE_LITERS)
                wineBottleText = Util.format(value: liters / WINE_BOTTLE_LITERS)
                damaskText = Util.format(value: liters / DAMASK_LITERS)
                octagonalDamaskText = Util.format(value: liters / OCTOGONAL_DAMASK_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                bucketText = Util.format(value: liters / BUCKET_LITERS)
                korchagaText = Util.format(value: liters / KORCHAGA_LITERS)
                barrelText = Util.format(value: liters / BARREL_LITERS)
                literText = Util.format(value: liters)
                
            case .quarter:
                let liters = value * QUARTER_LITERS
                
                scaleText = Util.format(value: liters / SCALE_LITERS)
                cupText = Util.format(value: liters / CUP_LITERS)
                chetushkaText = Util.format(value: liters / CHETUSHKA_LITERS)
                glassText = Util.format(value: liters / GLASS_LITERS)
                pigtailText = Util.format(value: liters / PIGTAIL_LITERS)
                vodkaBottleText = Util.format(value: liters / VODKA_BOTTLE_LITERS)
                wineBottleText = Util.format(value: liters / WINE_BOTTLE_LITERS)
                damaskText = Util.format(value: liters / DAMASK_LITERS)
                octagonalDamaskText = Util.format(value: liters / OCTOGONAL_DAMASK_LITERS)
                garnetText = Util.format(value: liters / GARNET_LITERS)
                bucketText = Util.format(value: liters / BUCKET_LITERS)
                korchagaText = Util.format(value: liters / KORCHAGA_LITERS)
                barrelText = Util.format(value: liters / BARREL_LITERS)
                literText = Util.format(value: liters)
                
            case .bucket:
                let liters = value * BUCKET_LITERS
                
                scaleText = Util.format(value: liters / SCALE_LITERS)
                cupText = Util.format(value: liters / CUP_LITERS)
                chetushkaText = Util.format(value: liters / CHETUSHKA_LITERS)
                glassText = Util.format(value: liters / GLASS_LITERS)
                pigtailText = Util.format(value: liters / PIGTAIL_LITERS)
                vodkaBottleText = Util.format(value: liters / VODKA_BOTTLE_LITERS)
                wineBottleText = Util.format(value: liters / WINE_BOTTLE_LITERS)
                damaskText = Util.format(value: liters / DAMASK_LITERS)
                octagonalDamaskText = Util.format(value: liters / OCTOGONAL_DAMASK_LITERS)
                garnetText = Util.format(value: liters / GARNET_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                korchagaText = Util.format(value: liters / KORCHAGA_LITERS)
                barrelText = Util.format(value: liters / BARREL_LITERS)
                literText = Util.format(value: liters)
                
            case .korchaga:
                let liters = value * KORCHAGA_LITERS
                
                scaleText = Util.format(value: liters / SCALE_LITERS)
                cupText = Util.format(value: liters / CUP_LITERS)
                chetushkaText = Util.format(value: liters / CHETUSHKA_LITERS)
                glassText = Util.format(value: liters / GLASS_LITERS)
                pigtailText = Util.format(value: liters / PIGTAIL_LITERS)
                vodkaBottleText = Util.format(value: liters / VODKA_BOTTLE_LITERS)
                wineBottleText = Util.format(value: liters / WINE_BOTTLE_LITERS)
                damaskText = Util.format(value: liters / DAMASK_LITERS)
                octagonalDamaskText = Util.format(value: liters / OCTOGONAL_DAMASK_LITERS)
                garnetText = Util.format(value: liters / GARNET_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                bucketText = Util.format(value: liters / BUCKET_LITERS)
                barrelText = Util.format(value: liters / BARREL_LITERS)
                literText = Util.format(value: liters)
                
            case .barrel:
                let liters = value * BARREL_LITERS
                
                scaleText = Util.format(value: liters / SCALE_LITERS)
                cupText = Util.format(value: liters / CUP_LITERS)
                chetushkaText = Util.format(value: liters / CHETUSHKA_LITERS)
                glassText = Util.format(value: liters / GLASS_LITERS)
                pigtailText = Util.format(value: liters / PIGTAIL_LITERS)
                vodkaBottleText = Util.format(value: liters / VODKA_BOTTLE_LITERS)
                wineBottleText = Util.format(value: liters / WINE_BOTTLE_LITERS)
                damaskText = Util.format(value: liters / DAMASK_LITERS)
                octagonalDamaskText = Util.format(value: liters / OCTOGONAL_DAMASK_LITERS)
                garnetText = Util.format(value: liters / GARNET_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                bucketText = Util.format(value: liters / BUCKET_LITERS)
                korchagaText = Util.format(value: liters / KORCHAGA_LITERS)
                literText = Util.format(value: liters)
                
            case .liter:
                let liters = value
                
                scaleText = Util.format(value: liters / SCALE_LITERS)
                cupText = Util.format(value: liters / CUP_LITERS)
                chetushkaText = Util.format(value: liters / CHETUSHKA_LITERS)
                glassText = Util.format(value: liters / GLASS_LITERS)
                pigtailText = Util.format(value: liters / PIGTAIL_LITERS)
                vodkaBottleText = Util.format(value: liters / VODKA_BOTTLE_LITERS)
                wineBottleText = Util.format(value: liters / WINE_BOTTLE_LITERS)
                damaskText = Util.format(value: liters / DAMASK_LITERS)
                octagonalDamaskText = Util.format(value: liters / OCTOGONAL_DAMASK_LITERS)
                garnetText = Util.format(value: liters / GARNET_LITERS)
                quarterText = Util.format(value: liters / QUARTER_LITERS)
                bucketText = Util.format(value: liters / BUCKET_LITERS)
                korchagaText = Util.format(value: liters / KORCHAGA_LITERS)
                barrelText = Util.format(value: liters / BARREL_LITERS)
        }
    }
    
    private func clearAllValues() {
        scaleText = ""
        cupText = ""
        chetushkaText = ""
        glassText = ""
        pigtailText = ""
        vodkaBottleText = ""
        wineBottleText = ""
        damaskText = ""
        octagonalDamaskText = ""
        garnetText = ""
        quarterText = ""
        bucketText = ""
        korchagaText = ""
        literText = ""
    }
}
