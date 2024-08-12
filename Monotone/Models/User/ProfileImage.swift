//
//  ProfileImage.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/12.
//

import Foundation
import ObjectMapper

class ProfileImage: Mappable {
    public var small: String?
    public var medium: String?
    public var large: String?

    init() {

    }

    required init?(map: Map) {
        self.mapping(map: map)
    }

    func mapping(map: Map) {
        self.small  <- map["small"]
        self.medium <- map["medium"]
        self.large  <- map["large"]
    }
}
