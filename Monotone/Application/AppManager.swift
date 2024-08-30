//
//  AppManager.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/21.
//

import Foundation

/// 应用授权凭证管理
final class AppManager {
    let credential: AppCredential = AppCredential()

    static let shared = AppManager()
    private init() {} // 这样可以防止其他对象使用这个类的默认 '()' 初始化器。
}
