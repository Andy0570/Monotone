//
//  String+Split.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/12.
//

import Foundation

extension String {

    /// 使用多个分隔符快速拆分字符串
    /// Reference: <https://stackoverflow.com/questions/32465121/splitting-a-string-in-swift-using-multiple-delimiters>
    /// @meomeomeo, answered May 23, 2019 at 6:17
    ///
    /// - Parameter separators: <#separators description#>
    /// - Returns: <#description#>
    func components(separatedBy separators: [String]) -> [String] {
        var result = [self]
        for separator in separators {
            result = result
                .map { $0.components(separatedBy: separator)}
                .flatMap { $0 }
        }
        return result
    }
}
