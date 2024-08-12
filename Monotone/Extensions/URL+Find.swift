//
//  URL+Find.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/12.
//

import Foundation

extension URL {

    /// 根据参数名找到相应的参数值
    func value(of name: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == name })?.value
    }
}
