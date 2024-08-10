//
//  UnsplashHelpCategory.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/8.
//

import UIKit

// 帮助
enum UnsplashHelpCategory {
    case account // 账户
    case licenses // 许可证
}

extension UnsplashHelpCategory: RawRepresentable, CaseIterable {
    init?(rawValue: (key: String, icon: UIImage, title: String, description: String, count: Int)) {
        switch rawValue.key {
        case "account":
            self = .account
        case "licenses":
            self = .licenses
        default:
            return nil
        }
    }

    var rawValue: (key: String, icon: UIImage, title: String, description: String, count: Int) {
        switch self {
        case .account:
            return (key: "account",
                    icon: UIImage(named: "help-category-account")!,
                    title: NSLocalizedString("uns_help_account_title", comment: "Managing your Unsplash account"),
                    description: NSLocalizedString("uns_help_account_description", comment: "Learn about your Unsplash account and how to manage your preferences"),
                    count: 10)
        case .licenses:
            return (key: "licenses",
                    icon: UIImage(named: "help-category-licenses")!,
                    title: NSLocalizedString("uns_help_license_title", comment: "Unsplash Licenses"),
                    description: NSLocalizedString("uns_help_license_description", comment: "The official Unsplash License guide and FAQ"),
                    count: 10)
        }
    }
}
