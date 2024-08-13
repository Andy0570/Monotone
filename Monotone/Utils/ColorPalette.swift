//
//  ColorPalette.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/12.
//

import UIKit
import Hue

// 纯代码实现的一套 APP 色彩方案，支持深色模式
// Reference: <http://www.chienerrant.com/blog/4190/>
class ColorPalette {

    /// Easily define two colors for both light and dark mode.
    /// - Parameters:
    ///   - darkColor: The color to use in dark mode.
    ///   - lightColor: The color to use in light mode.
    /// - Returns: A dynamic color that uses both given colors respectively for the given user interface style.
    public static func colorWithDarkMode(darkColor: UIColor, lightColor: UIColor) -> UIColor {
        // Return a fallback color for iOS 12 and lower
        guard #available(iOS 13.0, *) else { return lightColor }

        return UIColor.init(dynamicProvider: { (traitCollection: UITraitCollection) -> UIColor in
            if traitCollection.userInterfaceStyle == .dark {
                // Return the color for Dark Mode
                return darkColor
            } else {
                // Return the color for Light Mode
                return lightColor
            }
        })
    }

    public static func colorWithDarkMode(darkColorHex: String, lightColorHex: String) -> UIColor {
        return ColorPalette.colorWithDarkMode(darkColor: UIColor(hex: darkColorHex), lightColor: UIColor(hex: lightColorHex))
    }

    public static func colorWithUserInterfaceStyle(color: UIColor, with userInterfaceStyle: UIUserInterfaceStyle) -> UIColor {
        guard #available(iOS 13.0, *) else { return color }

        let traitCollection = UITraitCollection(userInterfaceStyle: userInterfaceStyle)
        return color.resolvedColor(with: traitCollection)
    }

    // MARK: - Color Varibles

    public static var colorBlack: UIColor {
        return self.colorWithDarkMode(darkColorHex: "#ffffff", lightColorHex: "#000000")
    }

    public static var colorGrayLighter: UIColor {
        return self.colorWithDarkMode(darkColorHex: "#242424", lightColorHex: "#ededed")
    }

    public static var colorGrayLight: UIColor {
        return self.colorWithDarkMode(darkColorHex: "#4a4a4a", lightColorHex: "#9b9b9b")
    }

    public static var colorGrayNormal: UIColor {
        return self.colorWithDarkMode(darkColorHex: "#999999", lightColorHex: "#999999")
    }

    public static var colorGrayHeavy: UIColor {
        return self.colorWithDarkMode(darkColorHex: "#9b9b9b", lightColorHex: "#4a4a4a")
    }

    public static var colorGrayHeavier: UIColor {
        return self.colorWithDarkMode(darkColorHex: "#ededed", lightColorHex: "#242424")
    }

    public static var colorWhite: UIColor {
        return self.colorWithDarkMode(darkColorHex: "#000000", lightColorHex: "#ffffff")
    }

    public static var colorForeground: UIColor {
        return self.colorWithDarkMode(darkColorHex: "#101010", lightColorHex: "#ffffff")
    }

    public static var colorBackground: UIColor {
        return self.colorWithDarkMode(darkColorHex: "#000000", lightColorHex: "#f7f7f7")
    }

    public static var colorShadow: UIColor {
        return UIColor.black.alpha(0.09)
    }

    public static var colorOverlayer: UIColor {
        return self.colorWithDarkMode(darkColor: UIColor.black.alpha(0.6), lightColor: UIColor.black.alpha(0.4))
    }

    public static var colorDenim: UIColor {
        return self.colorWithDarkMode(darkColorHex: "#3c5080", lightColorHex: "#3c5080")
    }

    public static var colorGreen: UIColor {
        return self.colorWithDarkMode(darkColorHex: "#2cb191", lightColorHex: "#2cb191")
    }

    public static var colorRed: UIColor {
        return self.colorWithDarkMode(darkColorHex: "#bb055a", lightColorHex: "#bb055a")
    }
}
