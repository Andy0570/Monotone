//
//  SceneTransition.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/28.
//

import UIKit

/// 对各个场景之间的"转场类型"进行建模
enum SceneTransition {
    case root(scene: Scene, wrapped: Bool = false)
    case push(scene: Scene)
    case present(scene: Scene, presentationStyle: UIModalPresentationStyle = .fullScreen, wrapped: Bool = false)
}
