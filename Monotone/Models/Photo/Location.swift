//
//  Location.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/12.
//

import ObjectMapper

class Location: Mappable {
    var city: String?
    var country: String?
    var position: Position?
    var title: String?

    required init?(map: Map) {
        self.mapping(map: map)
    }

    func mapping(map: Map) {
        city <- map["city"]
        country <- map["country"]
        position <- map["position"]
        title <- map["title"]
    }
}
