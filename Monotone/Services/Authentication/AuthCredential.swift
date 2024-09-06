//
//  AuthCredential.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/9/2.
//

import Foundation

let USER_DEFAULTS_KEY_AUTH_CREDENTIAL = "USER_DEFAULT_KEY_AUTH_CREDENTIAL"

/// 授权凭证
class AuthCredential: NSObject, NSCoding, NSSecureCoding {

    // MARK: - Property
    // 私有只读属性，该属性可以被外部读取，但不能写入
    private(set) var accessToken: String
    private(set) var tokenType: String
    private(set) var scope: String
    private(set) var createdAt: Double

    init(accessToken: String, tokenType: String, scope: String, createdAt: Double) {
        self.accessToken = accessToken
        self.tokenType = tokenType
        self.scope = scope
        self.createdAt = createdAt
    }

    // MARK: - NSCoding
    required init?(coder: NSCoder) {
        self.accessToken = coder.decodeObject(forKey: "accessToken") as? String ?? ""
        self.tokenType = coder.decodeObject(forKey: "tokenType") as? String ?? ""
        self.scope = coder.decodeObject(forKey: "scope") as? String ?? ""
        self.createdAt = coder.decodeDouble(forKey: "createdAt")
    }

    func encode(with coder: NSCoder) {
        coder.encode(self.accessToken, forKey: "accessToken")
        coder.encode(self.tokenType, forKey: "tokenType")
        coder.encode(self.scope, forKey: "scope")
        coder.encode(self.createdAt, forKey: "createdAt")
    }

    // MARK: - NSSecureCoding
    static var supportsSecureCoding: Bool {
        return true
    }
}

/// 将授权凭据实例归档、解档到偏好设置
extension AuthCredential {
    static func localCredential() -> AuthCredential? {
        guard let archivedData = UserDefaults.standard.data(forKey: USER_DEFAULTS_KEY_AUTH_CREDENTIAL) else {
            return nil
        }

        do {
            return try NSKeyedUnarchiver.unarchivedObject(ofClass: AuthCredential.self, from: archivedData)
        } catch {
            print("Unarchive AuthCredential failed.")
        }

        return nil
    }

    static func storeCredential(for credential: AuthCredential?) {
        guard let credential else {
            UserDefaults.standard.removeObject(forKey: USER_DEFAULTS_KEY_AUTH_CREDENTIAL)
            return
        }

        do {
            let archivedData = try NSKeyedArchiver.archivedData(withRootObject: credential, requiringSecureCoding: true)
            UserDefaults.standard.set(archivedData, forKey: USER_DEFAULTS_KEY_AUTH_CREDENTIAL)
        } catch {
            print("Archive AuthCredential failed.")
        }
    }
}
