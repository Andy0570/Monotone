//
//  Statistics.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/26.
//

import ObjectMapper

/// 统计数据
class Statistics: Mappable {
    var downloads: StatisticsIndicator?
    var views: StatisticsIndicator?
    var likes: StatisticsIndicator?

    required init?(map: Map) {
        self.mapping(map: map)
    }
    
    func mapping(map: Map) {
        downloads <- map["downloads"]
        views <- map["views"]
        likes <- map["likes"]
    }
}
