//
//  AnimatorTrigger.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/13.
//

import UIKit
import ViewAnimator

// 转场动画效果，对 ViewAnimator（https://github.com/marcosgriselli/ViewAnimator） 的封装
class AnimatorTrigger {
    // AnimationInterval
    public static var animationInterval: TimeInterval = 0.2

    // Duration
    public static var duration: TimeInterval = 0.3

    // MARK: - Float Animation
    enum FloatDirection {
        case toTop
        case toRight
        case toBottom
        case toLeft
    }

    public static func float(views: [UIView], 
                             direction: FloatDirection = .toTop,
                             delay: Double = 0.1,
                             animationInterval: TimeInterval = animationInterval,
                             duration: TimeInterval = duration) {
        let volumn: CGFloat = 50.0

        var vector: CGVector
        switch direction {
        case .toTop:
            vector = CGVector(dx: 0, dy: volumn)
        case .toRight:
            vector = CGVector(dx: -volumn, dy: 0)
        case .toBottom:
            vector = CGVector(dx: 0, dy: -volumn)
        case .toLeft:
            vector = CGVector(dx: volumn, dy: 0)
        }

        let animation = AnimationType.vector(vector)

        UIView.animate(views: views,
                       animations: [animation],
                       delay: delay,
                       animationInterval: animationInterval,
                       duration: duration)
    }
}
