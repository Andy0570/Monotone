//
//  UnsplashAgreement.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/8.
//

import Foundation

/// 许可条例
// TODO: Integrate agreements as HTML files displayed by WebView.
enum UnsplashAgreement {
    case license // 许可证
    // TODO: There is no Manifesto currently.
    case manifesto // 声明
    case privacyPolicy // 隐私政策
    case termsAndConditions // 规则与条例
    case apiTerms // API条款
}

extension UnsplashAgreement: RawRepresentable, CaseIterable {

    init?(rawValue: (key: String, title: String, content: URL?)) {
        switch rawValue.key {
        case "license":
            self = .license
        case "manifesto":
            self = .manifesto
        case "privacyPolicy":
            self = .privacyPolicy
        case "termsAndConditions":
            self = .termsAndConditions
        case "apiTerms":
            self = .apiTerms
        default:
            return nil
        }
    }

    var rawValue: (key: String, title: String, content: URL?) {
        var languageCode: String
        if #available(iOS 16, *) {
            languageCode = Locale.current.language.languageCode?.identifier == "zh" ? "cn" : "en"
        } else {
            // Fallback on earlier versions
            languageCode = Locale.current.languageCode == "zh" ? "cn" : "en"
        }

        switch self {
        case .license:
            return (key: "license",
                    title: NSLocalizedString("uns_agreement_license_title", comment: "License"),
                    content: Bundle.main.url(forResource: "license_\(languageCode)", withExtension: "html"))
        case .manifesto:
            return (key: "manifesto",
                    title: NSLocalizedString("uns_agreement_manifesto_title", comment: "Manifesto"),
                    content: Bundle.main.url(forResource: "manifesto_\(languageCode)", withExtension: "html"))
        case .privacyPolicy:
            return (key: "privacyPolicy",
                    title: NSLocalizedString("uns_agreement_privacy_policy_title", comment: "Privacy Policy"),
                    content: Bundle.main.url(forResource: "privacy_policy_\(languageCode)", withExtension: "html"))
        case .termsAndConditions:
            return (key: "termsAndConditions",
                    title: NSLocalizedString("uns_agreement_terms_and_conditions_title", comment: "Terms And Conditions"),
                    content: Bundle.main.url(forResource: "terms_and_conditions_\(languageCode)", withExtension: "html"))
        case .apiTerms:
            return (key: "apiTerms",
                    title: NSLocalizedString("uns_agreement_api_terms_title", comment: "API Terms"),
                    content: Bundle.main.url(forResource: "api_terms_\(languageCode)", withExtension: "html"))
        }
    }
}
