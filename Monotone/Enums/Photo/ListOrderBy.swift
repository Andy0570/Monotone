//
//  ListOrderBy.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/8.
//

import Foundation

// 照片列表排序方式
enum ListOrderBy {
    case popular // 人气
    case latest  // 最新
}

extension ListOrderBy: RawRepresentable, CaseIterable {
    init?(rawValue: (key: String, title: String)) {
        switch rawValue.key {
        case "popular":
            self = .popular
        case "latest":
            self = .latest
        default:
            return nil
        }
    }

    var rawValue: (key: String, title: String) {
        switch self {
        case .popular:
            return (key: "popular", title: NSLocalizedString("uns_home_segment_popular", comment: "Popular"))
        case .latest:
            return (key: "latest", title: NSLocalizedString("uns_home_segment_latest", comment: "Latest"))
        }
    }
}
