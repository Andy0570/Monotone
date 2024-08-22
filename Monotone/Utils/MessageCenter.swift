//
//  MessageCenter.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/13.
//

import SwiftMessages

/// 通知栏，对 SwiftMessages 的封装
final class MessageCenter {
    static let shared = MessageCenter()
    private init() {} // 这样可以防止其他对象使用这个类的默认 '()' 初始化器。

    func showMessage(title: String,
                     body: String,
                     theme: Theme = .success,
                     buttonText: String? = nil,
                     buttonTapHandler: (() -> Void)? = nil,
                     tapHandler: (() -> Void)? = nil) {
        SwiftMessages.show {
            let view = MessageView.viewFromNib(layout: .cardView)
            view.configureDropShadow()
            view.configureContent(title: title, body: body)
            view.configureTheme(theme)

            if let buttonTapHandler {
                view.buttonTapHandler = { _ in
                    buttonTapHandler()
                }
                view.button?.setTitle(buttonText, for: .normal)
                view.button?.isHidden = false
            } else {
                view.button?.isHidden = true
            }

            if let tapHandler {
                view.tapHandler = { _ in
                    tapHandler()
                }
            }

            return view
        }
    }
}
