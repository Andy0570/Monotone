//
//  URLs.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/12.
//

import Foundation
import ObjectMapper

class URLs: Mappable {
    public var raw: String?
    public var full: String?
    public var regular: String?
    public var small: String?
    public var thumb: String?

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
