//
//  TableViewSection.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/24.
//

import RxDataSources

struct TableViewSection {
    var key: String?
    var title: String?
    var description: String?
    // Tips: Any 可以表示任意类型，甚至包括函数类型。
    var items: [Any]
}

extension TableViewSection: SectionModelType {
    typealias Item = Any

    init(original: TableViewSection, items: [Item]) {
        self = original
        self.items = items
    }
}
