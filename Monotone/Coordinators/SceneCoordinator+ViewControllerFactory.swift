//
//  SceneCoordinator+ViewControllerFactory.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/28.
//

import UIKit

extension SceneCoordinator: ViewControllerFactory {
    func viewController(scene: Scene, with args: [String : Any?]?) -> UIViewController? {
        return UIViewController()
    }
}
