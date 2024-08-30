//
//  UIView+Border.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/12.
//

import UIKit

extension UIView{

    /// 为 UIView 添加边框样式。
    func applyDashedBorder(color: UIColor, width: CGFloat = 2.0, cornerRadius: CGFloat = 0) {
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let size = self.bounds.size
        let shapeRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)

        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: size.width / 2.0, y: size.height / 2.0)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = width
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [6,3]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: cornerRadius).cgPath

        self.layer.addSublayer(shapeLayer)
    }
}
