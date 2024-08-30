//
//  ColorPalette.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/12.
//

import UIKit
import Hue

/**
 纯代码实现的一套 APP 色彩方案，支持深色模式。

 SeeAlso: <http://www.chienerrant.com/blog/4190/>
 */
final class ColorPalette {
    
    /// Easily define two colors for both light and dark mode.
    /// - Parameters:
    ///   - darkColor: The color to use in dark mode.
    ///   - lightColor: The color to use in light mode.
    /// - Returns: A dynamic color that uses both given colors respectively for the given user interface style.
    static func colorWithDarkMode(darkColor: UIColor, lightColor: UIColor) -> UIColor {
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

    static func colorWithDarkMode(darkColorHex: String, lightColorHex: String) -> UIColor {
        return ColorPalette.colorWithDarkMode(darkColor: UIColor(hex: darkColorHex), lightColor: UIColor(hex: lightColorHex))
    }

    static func colorWithUserInterfaceStyle(color: UIColor, with userInterfaceStyle: UIUserInterfaceStyle) -> UIColor {
        guard #available(iOS 13.0, *) else { return color }

        let traitCollection = UITraitCollection(userInterfaceStyle: userInterfaceStyle)
        return color.resolvedColor(with: traitCollection)
    }

    // MARK: - Color Varibles

    static var colorBlack: UIColor {
        return self.colorWithDarkMode(darkColorHex: "#ffffff", lightColorHex: "#000000")
    }

    static var colorGrayLighter: UIColor {
        return self.colorWithDarkMode(darkColorHex: "#242424", lightColorHex: "#ededed")
    }

    static var colorGrayLight: UIColor {
        return self.colorWithDarkMode(darkColorHex: "#4a4a4a", lightColorHex: "#9b9b9b")
    }

    static var colorGrayNormal: UIColor {
        return self.colorWithDarkMode(darkColorHex: "#999999", lightColorHex: "#999999")
    }

    static var colorGrayHeavy: UIColor {
        return self.colorWithDarkMode(darkColorHex: "#9b9b9b", lightColorHex: "#4a4a4a")
    }

    static var colorGrayHeavier: UIColor {
        return self.colorWithDarkMode(darkColorHex: "#ededed", lightColorHex: "#242424")
    }

    static var colorWhite: UIColor {
        return self.colorWithDarkMode(darkColorHex: "#000000", lightColorHex: "#ffffff")
    }

    static var colorForeground: UIColor {
        return self.colorWithDarkMode(darkColorHex: "#101010", lightColorHex: "#ffffff")
    }

    static var colorBackground: UIColor {
        return self.colorWithDarkMode(darkColorHex: "#000000", lightColorHex: "#f7f7f7")
    }

    static var colorShadow: UIColor {
        return UIColor.black.alpha(0.09)
    }

    static var colorOverlayer: UIColor {
        return self.colorWithDarkMode(darkColor: UIColor.black.alpha(0.6), lightColor: UIColor.black.alpha(0.4))
    }

    static var colorDenim: UIColor {
        return self.colorWithDarkMode(darkColorHex: "#3c5080", lightColorHex: "#3c5080")
    }

    static var colorGreen: UIColor {
        return self.colorWithDarkMode(darkColorHex: "#2cb191", lightColorHex: "#2cb191")
    }

    static var colorRed: UIColor {
        return self.colorWithDarkMode(darkColorHex: "#bb055a", lightColorHex: "#bb055a")
    }
}
