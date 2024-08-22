//
//  WallpaperSize.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/8.
//

import UIKit

// 高清壁纸，尺寸类型
enum WallpaperSize {
    case all
    case iphone
    case android
    case mac
    case resolution4k
    case lock
    case ipad
}

extension WallpaperSize: RawRepresentable, CaseIterable {
    init?(rawValue: (key: String, title: String, aspectRatio: Double?, minSize: CGSize?, image: UIImage)) {
        switch rawValue.key {
        case "all":
            self = .all
        case "iphone":
            self = .iphone
        case "android":
            self = .android
        case "mac":
            self = .mac
        case "resolution4k":
            self = .resolution4k
        case "lock":
            self = .lock
        case "ipad":
            self = .ipad
        default:
            return nil
        }
    }

    var rawValue: (key: String, title: String, aspectRatio: Double?, minSize: CGSize?, image: UIImage) {
        switch self {
        case .all:
            return (key: "all",
                    title: NSLocalizedString("uns_wallpapers_size_all", comment: "All Wallpapers"),
                    aspectRatio: nil,
                    minSize: nil,
                    image: UIImage(named: "wallpaper-size-selection-all")!)
        case .iphone:
            return (key: "iphone",
                    title: NSLocalizedString("uns_wallpapers_size_iphone", comment: "iPhone"),
                    aspectRatio: 9.0 / 19.5,
                    minSize: nil,
                    image: UIImage(named: "wallpaper-size-selection-iphone")!)
        case .android:
            return (key: "android",
                    title: NSLocalizedString("uns_wallpapers_size_android", comment: "Android"),
                    aspectRatio: 10.0 / 16.0,
                    minSize: nil,
                    image: UIImage(named: "wallpaper-size-selection-android")!)
        case .mac:
            return (key: "mac",
                    title: NSLocalizedString("uns_wallpapers_size_mac", comment: "Mac"),
                    aspectRatio: 16.0 / 9.0,
                    minSize: nil,
                    image: UIImage(named: "wallpaper-size-selection-mac")!)
        case .resolution4k:
            return (key: "resolution4K",
                    title: NSLocalizedString("uns_wallpapers_size_4k", comment: "4K"),
                    aspectRatio: 10.0 / 16.0,
                    minSize: CGSize(width:3840.0,height:2160.0),
                    image: UIImage(named: "wallpaper-size-selection-4k")!)
        case .lock:
            return (key: "lock",
                    title: NSLocalizedString("uns_wallpapers_size_lock", comment: "lock"),
                    aspectRatio: 9.0 / 19.5,
                    minSize: nil,
                    image: UIImage(named: "wallpaper-size-selection-lock")!)
        case .ipad:
            return (key: "ipad",
                    title: NSLocalizedString("uns_wallpapers_size_ipad", comment: "iPad"),
                    aspectRatio: 4.0 / 3.0,
                    minSize: nil,
                    image: UIImage(named: "wallpaper-size-selection-ipad")!)
        }
    }

    func adaptWallpaperSize(width: CGFloat, height: CGFloat) -> Bool {
        if let aspectRatio = self.rawValue.aspectRatio {
            let ratio = Double(width / height)
            if ((ratio - 1.0) * ( aspectRatio - 1.0) < 0) {
                return false
            }

            let threshold = 0.50
            if (fabs(ratio - aspectRatio) > threshold) {
                return false
            }
        }

        if let minSize = self.rawValue.minSize {
            if (width < minSize.width || height < minSize.height) {
                return false
            }
        }

        return true
    }
}
