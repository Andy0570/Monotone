//
//  HistoricalValue.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/26.
//

import ObjectMapper

/// 历史值
class HistoricalValue: Mappable {
    var date: Date?
    var value: Int?

    required init?(map: Map) {
        self.mapping(map: map)
    }

    func mapping(map: Map) {
        date <- (map["date"], ISO8601DateTransform())
        value <- map["value"]
    }
}
