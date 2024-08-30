//
//  WKWebView+DarkMode.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/12.
//

import UIKit
import WebKit

extension WKWebView {
    
    /// Dark Mode for WKWebView.
    /// - Reference: <https://stackoverflow.com/questions/57203909/how-to-use-ios-13-darkmode-for-wkwebview>
    /// - Author: Dhaval Bhimani
    func toDark() {
        let cssString = "@media (prefers-color-scheme: dark) {body { background-color: black; color: white;} a:link {color: #0096e2;} a:visited {color: #9d57df;}}"
        let jsString = "var style = document.createElement('style'); style.innerHTML = '\(cssString)'; document.head.appendChild(style);"
        self.evaluateJavaScript(jsString, completionHandler: nil)
     }
}
