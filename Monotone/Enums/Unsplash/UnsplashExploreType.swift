//
//  UnsplashExploreType.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/8.
//

import Foundation

enum UnsplashExploreType {
    case explore // 探索
    case popular // 人气
}

extension UnsplashExploreType: RawRepresentable, CaseIterable {
    init?(rawValue: (key: String, title: String)) {
        switch rawValue.key {
        case "explore":
            self = .explore
        case "popular":
            self = .popular
        default:
            return nil
        }
    }

    var rawValue: (key: String, title: String) {
        switch self {
        case .explore:
            return (key: "explore", title: NSLocalizedString("uns_explore_type_explore", comment: "Explore"))
        case .popular:
            return (key: "popular", title: NSLocalizedString("uns_explore_type_popular", comment: "Popular"))
        }
    }
}
