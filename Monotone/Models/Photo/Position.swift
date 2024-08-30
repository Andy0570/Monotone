//
//  Position.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/12.
//

import ObjectMapper

class Position: Mappable {
    var latitude: String?
    var longitude: String?

    required init?(map: Map) {
        self.mapping(map: map)
    }

    func mapping(map: Map) {
        latitude <- map["latitude"]
        longitude <- map["longitude"]
    }
}
