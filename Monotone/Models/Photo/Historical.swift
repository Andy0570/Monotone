//
//  Historical.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/26.
//

import ObjectMapper

/// 历史
class Historical: Mappable {
    var change: Int?
    var resolution: String?
    var quantity: Int?
    var values: [HistoricalValue]?

    required init?(map: Map) {
        self.mapping(map: map)
    }

    func mapping(map: Map) {
        change <- map["change"]
        resolution <- map["resolution"]
        quantity <- map["quantity"]
        values <- map["values"]
    }
}
