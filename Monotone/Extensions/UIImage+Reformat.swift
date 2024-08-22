//
//  UIImage+Reformat.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/12.
//

import UIKit

extension UIImage{

    /// 调整 UIImage 尺寸
    /// Reference: <https://stackoverflow.com/questions/2658738/the-simplest-way-to-resize-an-uiimage>
    /// @Rogerio Chaves, answered Jun 30, 2014 at 20:12
    func resize(to size: CGSize, retina: Bool = true) -> UIImage? {
         // In next line, pass 0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
         // Pass 1 to force exact pixel size.
         UIGraphicsBeginImageContextWithOptions(
             /* size: */ size,
             /* opaque: */ false,
             /* scale: */ retina ? 0 : 1
         )
         defer { UIGraphicsEndImageContext() }

         self.draw(in: CGRect(origin: .zero, size: size))
         return UIGraphicsGetImageFromCurrentImageContext()
     }

    /// 便捷初始化方法
    /// 生成 1x1 大小的纯色图片
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
