//
//  Topic.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/26.
//

import ObjectMapper

class Topic: Mappable {
    var id: String?
    var slug: String?
    var title: String?
    var description: String?
    var publishedAt: Date?
    var updatedAt: Date?
    var startsAt: Date?
    var endsAt: Date?
    var featured: Bool?
    var totalPhotos: Int?
    var links: Links?
    var status: String?
    var owners: [User]?
//    var currentUserContributions:[]?
//    var totalCurrentUserSubmissions:[]?
    var coverPhoto: Photo?
    var previewPhotos: [PreviewPhoto]?

    required init?(map: Map) {
        self.mapping(map: map)
    }

    func mapping(map: Map) {
        id <- map["id"]
        slug <- map["slug"]
        title <- map["title"]
        description <- map["description"]
        publishedAt <- map["published_at"]
        updatedAt <- map["updated_at"]
        startsAt <- map["starts_at"]
        endsAt <- map["ends_at"]
        featured <- map["featured"]
        totalPhotos <- map["total_photos"]
        links <- map["links"]
        status <- map["status"]
        owners <- map["owners"]
        coverPhoto <- map["coverPhoto"]
        previewPhotos <- map["previewPhotos"]
    }
}
