//
//  ProfileImage.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/12.
//

import ObjectMapper

class ProfileImage: Mappable {
    var small: String?
    var medium: String?
    var large: String?

    required init?(map: Map) {
        self.mapping(map: map)
    }

    func mapping(map: Map) {
        self.small  <- map["small"]
        self.medium <- map["medium"]
        self.large  <- map["large"]
    }
}
