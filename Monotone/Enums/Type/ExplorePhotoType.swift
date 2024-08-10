//
//  ExplorePhotoType.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/8.
//

import UIKit

// 探索
enum ExplorePhotoType {
    case business // Business images
    case technology // Technology images
}

extension ExplorePhotoType: RawRepresentable, CaseIterable {
    init?(rawValue: (key: String, title: String, description: String, keywords: [String], images: [UIImage])) {
        switch rawValue.key {
        case "business":
            self = .business
        case "technology":
            self = .technology
        default:
            return nil
        }
    }

    var rawValue: (key: String, title: String, description: String, keywords: [String], images: [UIImage]) {
        switch self {
        case .business:
            return (key: "business",
                    title: "Business images",
                    description: "Download free business photos of real people getting ready for work in real life. No cheesy or stocky business pictures here.",
                    keywords: ["Office", "Work"],
                    images: [
                        UIImage(named: "explore-photo-type-business-item-1")!,
                        UIImage(named: "explore-photo-type-business-item-2")!
                    ])
        case .technology:
            return (key: "technology",
                    title: "Technology images",
                    description: "Browse these technology images featuring workspaces fill with gadgets, MacBooks, iPhones, and cameras.",
                    keywords: ["iPad", "Phone"],
                    images: [
                        UIImage(named: "explore-photo-type-technology-item-1")!,
                        UIImage(named: "explore-photo-type-technology-item-2")!
                    ])
        }
    }
}
