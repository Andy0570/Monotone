//
//  UserManager.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/22.
//

import Foundation
import RxSwift
import RxRelay

// 用户管理
final class UserManager {
    // MARK: - Public
    let currentUser: BehaviorRelay<User?> = BehaviorRelay<User?>(value: nil)

    // MARK: - Private
    // TODO: 待实现 UserService 类后完善
    // private let userService: UserService
    private let disposeBag = DisposeBag()

    // MARK: - Single Skeleton
    static let shared = UserManager()
    private init() {} // 这样可以防止其他对象使用这个类的默认 '()' 初始化器。
}
