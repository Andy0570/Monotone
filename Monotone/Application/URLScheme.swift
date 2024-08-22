//
//  URLScheme.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/22.
//

import Foundation

class URLScheme{
    // For XCode 12.5 or later, the scheme for ASWebAuthenticationSession should be written like this instead of "monotone://".
    // Otherwise, a error rises - "A scheme should not include special characters such as..."
    // 对于 Xcode 12.5 或更高版本，ASWebAuthenticationSession 的 scheme 应该这样写，而不是 "monotone://"。
    // 否则，就会出现错误--"一个 scheme 不应包括特殊字符，如..."
    public static let main = "monotone"
}
