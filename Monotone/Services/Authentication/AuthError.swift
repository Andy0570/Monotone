//
//  AuthError.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/9/2.
//

import Foundation

class AuthError: LocalizedError {
    var title: String
    var description: String

    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}
