//
//  Decimal+Format.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/12.
//

import Foundation

extension Decimal {

    /// 将带小数的数字转换为字符串
    /// Reference: <https://stackoverflow.com/questions/46933209/how-to-convert-decimal-to-string-with-two-digits-after-separator>
    /// @Ladislav, answered Oct 25, 2017 at 13:16
    ///
    /// - Parameter digit: 小数点后留的位数
    /// - Returns: 返回的字符串
    func format(digit:Int = 0) -> String? {
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.minimumFractionDigits = digit
        formatter.maximumFractionDigits = digit
        return formatter.string(from: self as NSDecimalNumber)
    }
}
