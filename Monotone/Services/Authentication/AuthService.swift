//
//  AuthService.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/9/2.
//

import Foundation
import RxSwift

class AuthService: BaseService {
    /// 通过本地缓存的“应用授权凭证”获取 Code 值
    func authorize() -> Observable<String> {
        return AuthManager.shared.authorize()
    }

    /// 通过 Code 值获取 access_token
    func token(code: String) -> Observable<String> {
        return AuthManager.shared.token(code: code)
    }
}
