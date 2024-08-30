//
//  StatisticsIndicator.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/26.
//

import ObjectMapper

/// 统计指标
class StatisticsIndicator: Mappable {
    var total: Int?
    var historical: Historical?

    required init?(map: Map) {
        self.mapping(map: map)
    }

    func mapping(map: Map) {
        total <- map["total"]
        historical <- map["historical"]
    }
}
