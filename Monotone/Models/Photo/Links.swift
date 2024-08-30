//
//  Links.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/12.
//

import ObjectMapper

class Links: Mappable {
    var selfLink: String?
    var html: String?
    var photos: String?
    var likes: String?
    var download: String?
    var downloadLocation: String?

    required init?(map: Map) {
        self.mapping(map: map)
    }

    func mapping(map: Map) {
        selfLink <- map["self"]
        html <- map["html"]
        photos <- map["photos"]
        likes <- map["likes"]
        download <- map["download"]
        downloadLocation <- map["download_location"]
    }
}
