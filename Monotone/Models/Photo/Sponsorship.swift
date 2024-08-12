//
//  Sponsorship.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/12.
//

import Foundation
import ObjectMapper

// 资助?
class Sponsorship: Mappable {
    // var impressionURLs: []?
    var tagline: String?
    var taglineURL: String?
    var sponsor: User?

    required init?(map: Map) {
        self.mapping(map: map)
    }

    func mapping(map: Map) {
        // impressionURLs <- map["impression_urls"]
        tagline <- map["tagline"]
        taglineURL <- map["tagline_url"]
        sponsor <- map["sponsor"]
    }
}
