//
//  AuthArguments.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/9/2.
//

import Foundation

/// 授权参数
enum AuthArguments {
    // 使用 static let 把一个类型属性声明为常量
    // 使用无枚举值的枚举类型（caseless enum）时，它的优点是不会被意外的实例化，只是一个单纯的命名空间。
    static let redirectUri: String = "monotone://unsplash"
    static let responseType: String = "code"
    static let scope: String = "public+read_user+write_user+read_photos+write_photos+write_likes+write_followers+read_collections+write_collections"
    static let grandType: String = "authorization_code"
}
