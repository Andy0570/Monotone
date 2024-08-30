//
//  Photo.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/12.
//

import ObjectMapper

class Photo: Mappable, Equatable {
    var id: String?
    var createdAt: Date?
    var updatedAt: Date?
    var promotedAt: Date?
    var width: Int?
    var height: Int?
    var color: String?
    var blurHash: String?
    var description: String?
    var altDescription: String?
    var urls: URLs?
    var links: Links?
//    var categories: []?
    var sponsorship: Sponsorship?
    var likes: Int?
    var likedByUser: Bool?
    var currentUserCollections:[Collection]?
    var user: User?
    var exif: Exif?
    var location: Location?
//    var meta:?
//    var tags:?

    // MARK: - Mappable

    required init?(map: Map) {
        self.mapping(map: map)
    }

    func mapping(map: Map) {
        id <- map["id"]
        createdAt <- (map["created_at"], ISO8601DateTransform())
        updatedAt <- (map["updated_at"], ISO8601DateTransform())
        promotedAt <- (map["promoted_at"], ISO8601DateTransform())
        width <- map["width"]
        height <- map["height"]
        color <- map["color"]
        blurHash <- map["blur_hash"]
        description <- map["description"]
        altDescription <- map["alt_description"]
        urls <- map["urls"]
        links <- map["links"]
        sponsorship <- map["sponsorship"]
        likes <- map["likes"]
        likedByUser <- map["liked_by_user"]
        currentUserCollections <- map["current_user_collections"]
        user <- map["user"]
        exif <- map["exif"]
        location <- map["location"]
    }

    // MARK: - Equatable

    static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.id == rhs.id
    }
}


