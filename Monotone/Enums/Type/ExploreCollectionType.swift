//
//  ExploreCollectionType.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/8.
//

import Foundation

enum ExploreCollectionType {
    case celebration
    case colors
}

extension ExploreCollectionType: RawRepresentable, CaseIterable {
    init?(rawValue: (key: String, title: String, description: String, collections: [Collection]?)) {
        switch rawValue.key {
        case "celebration":
            self = .celebration
        case "colors":
            self = .colors
        default:
            return nil
        }
    }

    var rawValue: (key: String, title: String, description: String, collections: [Collection]?) {
        switch self {
        case .celebration:
            return (key: "celebration",
                    title: "celebration",
                    description: "Download the most popular images for your next celebration. From pictures of birthdays to holidays to anniversaries these community curated collections of images have you covered.",
                    collections: [])
        case .colors:
            return (key: "colors",
                    title: "colors",
                    description: "Beautiful free photos of every color in the rainbow.",
                    collections: [])
        }
    }
}
