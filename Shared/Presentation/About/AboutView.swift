//
//  AboutView.swift
//  Glagolitsa
//
//  Created by Дмитрiй Канунниковъ on 12.07.2022.
//

import SwiftUI

struct AboutView: View {
    
    @AppStorage("SettingsView.isSystemFontAndSize")
    private var isSystemFontAndSize: Bool = true
    
    @AppStorage("SettingsView.isPreRevolutionary")
    private var isPreRevolutionary: Bool = false
    
    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text(isPreRevolutionary ? "​Русскія​ мѣры" : Util.getAppDisplayName())
                    .font(isSystemFontAndSize ? .headline : Config.customBodyFont)
                
                Text("\(isPreRevolutionary ? "Версія" : "Версия") \(Util.getAppVersion()), сборка \(Util.getAppBuild())")
                    .font(isSystemFontAndSize ? .caption : Config.customCaptionFont)
                
                Text("© 2023 Дмитрiй Канунниковъ")
                    .font(isSystemFontAndSize ? .subheadline : Config.customSubhedlineFont)
                    .padding(.top, 1)
            }
            
            Section {
                Link(destination: Config.APPSTORE_APP_REVIEW_URL) {
                    Text(isPreRevolutionary ? "Оцѣнить" : "Оценить")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
                
#if !os(tvOS)
                ShareLink(item: Config.APPSTORE_APP_URL) {
                    Text(isPreRevolutionary ? "Подѣлиться" : "Поделиться")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
#endif
                
                Link(destination: Config.APPSTORE_DEVELOPER_URL) {
                    Text(isPreRevolutionary ? "Другія приложенія" : "Другие приложения")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
            } header: {
                Text("App Store")
                    .font(isSystemFontAndSize ? .footnote : Config.customFootnoteFont)
            } footer: {
                Text(isPreRevolutionary ? "Ваше мнѣніе очень важно для меня. Пожалуйста, не полѣнитесь поставить оцѣнку и написать отзывъ." : "Ваше мнение очень важно для меня. Пожалуйста, не поленитесь поставить оценку и написать отзыв.")
                    .font(isSystemFontAndSize ? .footnote : Config.customFootnoteFont)
            }
            
            Section {
                Link(destination: Config.EMAIL_URL) {
                    Text("Написать письмо")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
                
#if !os(watchOS)
                Link(destination: Config.YOUTUBE_URL) {
                    Text(isPreRevolutionary ? "Мой YouTube-каналъ" : "Мой YouTube-канал")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
                
                Link(destination: Config.TWITTER_URL) {
                    Text(isPreRevolutionary ? "Я въ Twitter" : "Я в Twitter")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
                
                Link(destination: Config.INSTAGRAM_URL) {
                    Text(isPreRevolutionary ? "Я въ Instagram" : "Я в Instagram")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
#endif
            } header: {
                Text("Обратная связь")
                    .font(isSystemFontAndSize ? .footnote : Config.customFootnoteFont)
            } footer: {
                Text(isPreRevolutionary ? "Въ случаѣ вопросовъ или предложеній, я къ Вашимъ услугамъ. Будемъ на связи!" : "В случае вопросов или предложений, я к Вашим услугам. Будем на связи!")
                    .font(isSystemFontAndSize ? .footnote : Config.customFootnoteFont)
            }
            
#if !os(watchOS)
            Section {
                Link(destination: Config.PRIVACY_POLICY_URL) {
                    Text("Читать")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
            } header: {
                Text(isPreRevolutionary ? "Политика конфиденціальности" : "Политика конфиденциальности")
                    .font(isSystemFontAndSize ? .footnote : Config.customFootnoteFont)
            } footer: {
                Text(isPreRevolutionary ? "Подробная информація о томъ, какъ приложеніе используетъ Ваши ​данные​." : "Подробная информация о том, как приложение использует Ваши данные.")
                    .font(isSystemFontAndSize ? .footnote : Config.customFootnoteFont)
            }
            
            Section {
                Link(destination: Config.PATREON) {
                    Text("Patreon")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
                
                Link(destination: Config.BUY_ME_A_COFFEE) {
                    Text("Buy Me a Coffee")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
                
                if Locale.current.language.languageCode?.identifier == Locale.LanguageCode.russian.identifier {
                    Link(destination: Config.BOOSTY) {
                        Text("Boosty")
                            .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                    }
                }
            } header: {
                Text("Поддержка")
                    .font(isSystemFontAndSize ? .footnote : Config.customFootnoteFont)
            } footer: {
                Text(isPreRevolutionary ? "Если Вамъ нравится результатъ моего труда, то Вы можете, при желаніи, поддержать меня однимъ изъ вышеперечисленныхъ способовъ." : "Если Вам нравится результат моего труда, то Вы можете, при желании, поддержать меня одним из вышеперечисленных способов.")
                    .font(isSystemFontAndSize ? .footnote : Config.customFootnoteFont)
            }
#endif
        }
        .navigationTitle(isPreRevolutionary ? "О программѣ" : "О программе")
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
