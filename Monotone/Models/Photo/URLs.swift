//
//  URLs.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/12.
//

import ObjectMapper

class URLs: Mappable {
    var raw: String?
    var full: String?
    var regular: String?
    var small: String?
    var thumb: String?

    required init?(map: Map) {
        self.mapping(map: map)
    }

    func mapping(map: Map) {
        self.raw <- map["raw"]
        self.full <- map["full"]
        self.regular <- map["regular"]
        self.small <- map["small"]
        self.thumb <- map["thumb"]
    }
}
