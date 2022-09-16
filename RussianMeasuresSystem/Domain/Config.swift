//
//  Config.swift
//  Glagolitsa
//
//  Created by Дмитрiй Канунниковъ on 13.07.2022.
//

import SwiftUI

struct Config {
    
    //--- Test
    
    static let isTestMode = false
    
    //--- App Store
    
    static let APPSTORE_APP_ID = 1638481772
    static let APPSTORE_APP_URL = URL(string: "https://itunes.apple.com/app/id\(APPSTORE_APP_ID)")!
    static let APPSTORE_APP_REVIEW_URL = URL(string: "https://itunes.apple.com/app/id\(APPSTORE_APP_ID)?action=write-review")!
    static let APPSTORE_DEVELOPER_URL = URL(string: "https://itunes.apple.com/developer/id1449411291")!
    
    static let PACKAGE_NAME = "software.kanunnikoff.RussianMeasuresSystem"
    
    //--- Feedback
    
    static let EMAIL_URL = URL(string: "mailto:dmitry.kanunnikoff@gmail.com?subject=%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B5%20%D0%BC%D0%B5%D1%80%D1%8B%20%28iOS%29")!
    static let YOUTUBE_URL = URL(string: "https://www.youtube.com/c/DmitryKanunnikoff")!
    static let TWITTER_URL = URL(string: "https://twitter.com/DKanunnikoff")!
    static let INSTAGRAM_URL = URL(string: "https://www.instagram.com/dmitry.kanunnikoff")!
    
    //--- Privacy
    
    static let PRIVACY_POLICY_URL = URL(string: "https://docs.google.com/document/d/1WtIXYe2GlQrs3SeG4ore5PZi_tGyfzFb7hOuj6rU4vg/edit?usp=sharing")!
    
    // --- Support
    
    static let PATREON = URL(string: "https://patreon.com/DmitryKanunnikoff")!
    static let BOOSTY = URL(string: "https://boosty.to/dmitrykanunnikoff")!
    
    //---
    
    static let customFont: Font = .custom("Monomakh Unicode TT", size: 17)
    static let customBodyFont: Font = .custom("Monomakh Unicode TT", size: 17)
    static let customHeadlineFont: Font = .custom("Monomakh Unicode TT", size: 17)
    static let customSubhedlineFont: Font = .custom("Monomakh Unicode TT", size: 15)
    static let customSectionTitleFont: Font = .custom("Monomakh Unicode TT", size: 13)
    static let customSectionFooterFont: Font = .custom("Monomakh Unicode TT", size: 13)
    static let customCaptionFont: Font = .custom("Monomakh Unicode TT", size: 12)
}
