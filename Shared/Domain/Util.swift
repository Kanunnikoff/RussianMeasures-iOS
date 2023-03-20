//
//  Util.swift
//  Glagolitsa
//
//  Created by Дмитрiй Канунниковъ on 13.07.2022.
//

#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif
import SwiftUI

struct Util {
    
    private static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 6
        formatter.groupingSeparator = " "
        
        return formatter
    }()
    
    
    private init() {
    }
    
    static func format(value: Double) -> String {
        formatter.string(from: NSNumber(value: value)) ?? ""
    }
    
    static func getAppName() -> String? {
        Bundle.main.infoDictionary?["CFBundleName"] as? String
    }
    
    static func getAppDisplayName() -> String {
        Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? getAppName() ?? "App Display Name"
    }
    
    static func getAppVersion() -> String {
        guard let currentVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String else {
            return ""
        }
        
        return currentVersion
    }
    
    static func getAppBuild() -> String {
        let infoDictionaryKey = kCFBundleVersionKey as String
        guard let build = Bundle.main.object(forInfoDictionaryKey: infoDictionaryKey) as? String else {
            return ""
            
        }
        
        return build
    }
}
