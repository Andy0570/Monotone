//
//  Collection.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/10.
//

import Foundation

class Collection: Equatable {
    var id: String?
    var title: String?
//    var coverPhoto: Photo?
//    var description: String?
//    var publishedAt: Date?
//    var lastCollectedAt: Date?
//    var updatedAt: Date?
//    var totalPhotos: Int?
//    var previewPhotos: [Photo]?
//    var sponsorship: Sponsorship?
//    var user: User?
//    var shareKey: String?
//    var links: Links?
//    var isPrivate: Bool?

    static func == (lhs: Collection, rhs: Collection) -> Bool {
        return lhs.id == rhs.id
    }
}
