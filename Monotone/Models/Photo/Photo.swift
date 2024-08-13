//
//  Photo.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/12.
//

import Foundation

class Photo: Equatable {
    public var id: String?
    public var createdAt: Date?
    public var updatedAt: Date?
    public var promotedAt: Date?
    public var width: Int?
    public var height: Int?
    public var color: String?
    public var blurHash: String?
    public var description: String?
    public var altDescription: String?
    public var urls: URLs?
    public var links: Links?
//    public var categories: []?
    public var sponsorship: Sponsorship?
    public var likes: Int?
    public var likedByUser: Bool?
    public var currentUserCollections:[Collection]?
    public var user: User?
    public var exif: Exif?
    public var location: Location?
//    public var meta:?
//    public var tags:?

    init() {
        
    }

    static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.id == rhs.id
    }
}


