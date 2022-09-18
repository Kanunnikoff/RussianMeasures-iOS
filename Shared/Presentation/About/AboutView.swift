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
    
    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text(Util.getAppDisplayName())
                    .font(isSystemFontAndSize ? .headline : Config.customBodyFont)
                
                Text("Версия \(Util.getAppVersion()), сборка \(Util.getAppBuild())")
                    .font(isSystemFontAndSize ? .caption : Config.customCaptionFont)
                
                Text("© 2022 Дмитрiй Канунниковъ")
                    .font(isSystemFontAndSize ? .subheadline : Config.customSubhedlineFont)
                    .padding(.top, 1)
            }
            
            Section {
                Link(destination: Config.APPSTORE_APP_REVIEW_URL) {
                    Text("Оценить")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
                
#if !os(tvOS)
                ShareLink(item: Config.APPSTORE_APP_URL) {
                    Text("Поделиться")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
#endif
                
                Link(destination: Config.APPSTORE_DEVELOPER_URL) {
                    Text("Другие приложения")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
            } header: {
                Text("App Store")
                    .font(isSystemFontAndSize ? .footnote : Config.customFootnoteFont)
            } footer: {
                Text("Ваше мнение очень важно для меня. Пожалуйста, не поленитесь поставить оценку и написать отзыв.")
                    .font(isSystemFontAndSize ? .footnote : Config.customFootnoteFont)
            }
            
            Section {
                Link(destination: Config.EMAIL_URL) {
                    Text("Написать письмо")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
                
#if !os(watchOS)
                Link(destination: Config.YOUTUBE_URL) {
                    Text("Мой YouTube-канал")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
                
                Link(destination: Config.TWITTER_URL) {
                    Text("Я в Twitter")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
                
                Link(destination: Config.INSTAGRAM_URL) {
                    Text("Я в Instagram")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
#endif
            } header: {
                Text("Обратная связь")
                    .font(isSystemFontAndSize ? .footnote : Config.customFootnoteFont)
            } footer: {
                Text("В случае вопросов или предложений, я к Вашим услугам. Будем на связи!")
                    .font(isSystemFontAndSize ? .footnote : Config.customFootnoteFont)
            }
            
#if !os(watchOS)
            Section {
                Link(destination: Config.PRIVACY_POLICY_URL) {
                    Text("Читать")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
            } header: {
                Text("Политика конфиденциальности")
                    .font(isSystemFontAndSize ? .footnote : Config.customFootnoteFont)
            } footer: {
                Text("Подробная информация о том, как приложение использует Ваши данные.")
                    .font(isSystemFontAndSize ? .footnote : Config.customFootnoteFont)
            }
            
            Section {
                Link(destination: Config.PATREON) {
                    Text("Patreon")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
                
                Link(destination: Config.BOOSTY) {
                    Text("Boosty")
                        .font(isSystemFontAndSize ? .body : Config.customBodyFont)
                }
            } header: {
                Text("Поддержка")
                    .font(isSystemFontAndSize ? .footnote : Config.customFootnoteFont)
            } footer: {
                Text("Если Вам нравится результат моего труда, то Вы можете, при желании, поддержать меня одним из вышеперечисленных способов.")
                    .font(isSystemFontAndSize ? .footnote : Config.customFootnoteFont)
            }
#endif
        }
        .navigationTitle("О программе")
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
