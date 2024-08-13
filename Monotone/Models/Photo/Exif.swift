//
//  Exif.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/12.
//

import Foundation
import ObjectMapper

/// 数码照片的属性信息和拍摄数据
class Exif: Mappable {
    var iso: String?
    var aperture: String?
    var model: String?
    var focalLength: String?
    var exposureTime: String?
    var make: String?

    init() {

    }

    required init?(map: Map) {
        self.mapping(map: map)
    }

    func mapping(map: Map) {
        iso <- map["iso"]
        aperture <- map["aperture"]
        model <- map["model"]
        focalLength <- map["focal_length"]
        exposureTime <- map["exposure_time"]
        make <- map["make"]
    }
}
