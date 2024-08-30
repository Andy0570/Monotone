//
//  PreviewPhoto.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/26.
//

import ObjectMapper

class PreviewPhoto: Mappable {
    var updatedAt: String?
    var createdAt: String?
    var urls: URLs?
    var id: String?

    required init?(map: Map) {
        self.mapping(map: map)
    }

    func mapping(map: Map) {
        updatedAt <- map["updated_at"]
        createdAt <- map["created_at"]
        urls <- map["urls"]
        id <- map["id"]
    }
}
