//
//  User.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/12.
//

import ObjectMapper

class User: Mappable {
    var id: String?
    var updatedAt: Date?
    var username: String?
    var name: String?
    var firstName: String?
    var lastName: String?
    var instagramUsername: String?
    var twitterUsername: String?
    var portfolioURL: String?
    var bio: String?
    var location: Location?
    var links: Links?
    var profileImage: ProfileImage?
    var totalCollections: Int?
    var totalLikes: Int?
    var totalPhotos: Int?
    var acceptedTos: Bool?
    var followedByUser: Bool?
    var photos: [Photo]?
//    var badge:?
//    var tags:?
    var followersCount: Int?
    var followingCount: Int?
    var allowMessages: Bool?
    var numericId: Int?
    var downloads: Int?
//    var meta?

    required init?(map: Map) {
        self.mapping(map: map)
    }

    func mapping(map: Map) {
        id <- map["id"]
        updatedAt <- (map["updated_at"], ISO8601DateTransform())
        username <- map["username"]
        name <- map["name"]
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        instagramUsername <- map["instagram_username"]
        twitterUsername <- map["twitter_username"]
        portfolioURL <- map["portfolio_url"]
        bio <- map["bio"]
        location <- map["location"]
        links <- map["links"]
        profileImage <- map["profile_image"]
        totalCollections <- map["total_collections"]
        totalLikes <- map["total_likes"]
        totalPhotos <- map["total_photos"]
        acceptedTos <- map["accepted_tos"]
        followedByUser <- map["followed_by_user"]
        photos <- map["photos"]
        followersCount <- map["followers_count"]
        followingCount <- map["following_count"]
        allowMessages <- map["allow_messages"]
        numericId <- map["numeric_id"]
        downloads <- map["downloads"]
    }
}
