//
//  SideMenuPage.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/8.
//

import Foundation

// 侧面菜单
enum SideMenuPage {
    case myPhotos // 我的照片
    case hiring // 应募
    case licenses // 许可条例
    case help // 帮助
    case madeWithUnsplash // 周边制作
}

extension SideMenuPage: RawRepresentable, CaseIterable {
    init?(rawValue: (key: String, description: String)) {
        switch rawValue.key {
        case "myPhotos":
            self = .myPhotos
        case "hiring":
            self = .hiring
        case "licenses":
            self = .licenses
        case "help":
            self = .help
        case "madeWithUnsplash":
            self = .madeWithUnsplash
        default:
            return nil
        }
    }

    var rawValue: (key: String, description: String) {
        switch self {
        case .myPhotos:
            return (key: "myPhotos",
                    description: NSLocalizedString("uns_side_menu_option_my_photos", comment: "My Photos"))
        case .hiring:
            return (key: "hiring",
                    description: NSLocalizedString("uns_side_menu_option_hiring", comment: "Hiring"))
        case .licenses:
            return (key: "licenses",
                    description: NSLocalizedString("uns_side_menu_option_licenses", comment: "Licenses"))
        case .help:
            return (key: "help",
                    description: NSLocalizedString("uns_side_menu_option_help", comment: "Help"))
        case .madeWithUnsplash:
            return (key: "madeWithUnsplash",
                    description: NSLocalizedString("uns_side_menu_option_made_with_unsplash", comment: "Made with Unsplash"))
        }
    }
}
