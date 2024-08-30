//
//  BaseNavigationController.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/29.
//

import UIKit

class BaseNavigationController: UINavigationController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buildSubviews()
        buildLogic()
    }

    func buildSubviews() {
        // Implemented by subclass.
    }

    func buildLogic() {
        // Implemented by subclass.
    }

    func updateNavBarTransparent(transparent: Bool) {
        // Implemented by subclass.
    }

    func updateNavBarHidden(hidden: Bool) {
        // Implemented by subclass.
    }

    func updateNavItems(color: UIColor? = nil, leftItems: [UIBarButtonItem]? = nil, rightItems: [UIBarButtonItem]? = nil) {
        // Implemented by subclass.
    }
}
