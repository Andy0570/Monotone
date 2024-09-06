//
//  AuthManager.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/9/2.
//

import Foundation
import AuthenticationServices

import Alamofire
import SwiftyJSON
import RxSwift
import RxRelay

final class AuthManager: NSObject {
    static let shared = AuthManager()
    private override init() {
        super.init()
    }

    // MARK: - Property
    let domain: String = "https://unsplash.com/oauth/"
    var credential: AuthCredential? {
        get {
            return AuthCredential.localCredential()
        }
        set {
            AuthCredential.storeCredential(for: newValue)
        }
    }

    private var authSession: ASWebAuthenticationSession!

    // 获取授权 Code 值
    func authorize() -> Observable<String> {
        // 通过本地缓存的“应用授权凭证”获取应用授权 token 信息，作为请求参数
        let params = [
            URLQueryItem(name: "client_id", value: AppManager.shared.credential.accessKey),
            URLQueryItem(name: "redirect_uri", value: AuthArguments.redirectUri),
            URLQueryItem(name: "response_type", value: AuthArguments.responseType),
            URLQueryItem(name: "scope", value: AuthArguments.scope)
        ]

        var urlComponents = URLComponents(string: self.domain + "authorize")!
        urlComponents.queryItems = params

        return Observable.create { observer -> Disposable in
            let authSession = ASWebAuthenticationSession(url: urlComponents.url!, callbackURLScheme: URLScheme.main) { callbackURL, error in
                guard error == nil, let callbackURL else {
                    observer.onCompleted()
                    return
                }

                guard let code = callbackURL.value(of: "code") else {
                    observer.onCompleted()
                    return
                }

                observer.onNext(code)
                observer.onCompleted()
            }

            if #available(iOS 13.0, *) {
                authSession.presentationContextProvider = self
            }

            authSession.prefersEphemeralWebBrowserSession = true
            authSession.start()

            return Disposables.create()
        }
    }

    // 通过 Code 值获取 token
    func token(code: String) -> Observable<String> {
        let params = [
            "client_id": AppManager.shared.credential.accessKey,
            "client_secret": AppManager.shared.credential.secretKey,
            "redirect_uri": AuthArguments.redirectUri,
            "code": code,
            "grant_type": AuthArguments.grandType
        ]

        let url = self.domain + "token"

        return Observable.create { observer -> Disposable in
            let request = AF.request(url, method: .post, parameters: params)
                .response { responseData in
                    switch responseData.result {
                    case .success(let data):
                        if responseData.response?.statusCode == 200 {
                            do {
                                let json = try JSON(data: data!)

                                let accessToken = json["access_token"].stringValue
                                let tokenType = json["token_type"].stringValue
                                let scope = json["scope"].stringValue
                                let createdAt = json["created_at"].doubleValue
                                self.credential = AuthCredential(accessToken: accessToken, tokenType: tokenType, scope: scope, createdAt: createdAt)
                                observer.onNext(accessToken)
                            } catch  {
                                print("Could not decode success result from \(url), the error is \(error.localizedDescription)")
                            }
                        } else {
                            do {
                                let json = try JSON(data: data!)

                                let title = json["error"].string ?? ""
                                let description = json["error_description"].string ?? ""
                                let error = AuthError(title: title, description: description)

                                MessageCenter.shared.showMessage(title: title, body: description, theme: .error)
                                observer.onError(error)
                            } catch {
                                print("Could not decode failure errors from \(url), the error is \(error.localizedDescription)")

                                MessageCenter.shared.showMessage(title: NSLocalizedString("uns_auth_error_title", comment: "Oops, there was a problem of authentication..."), body: error.localizedDescription, theme: .error)
                            }
                        }
                        
                        observer.onCompleted()

                    case .failure(let error):
                        print("\(error.localizedDescription)")
                        MessageCenter.shared.showMessage(title: NSLocalizedString("uns_auth_error_title", comment: "Oops, there was a problem of authentication..."), body: error.localizedDescription, theme: .error)
                        observer.onError(error)
                    }
                }

            return Disposables.create {
                request.cancel()
            }
        }
    }
}

// MARK: - ASWebAuthenticationPresentationContextProviding

extension AuthManager: ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return ASPresentationAnchor()
    }
}
