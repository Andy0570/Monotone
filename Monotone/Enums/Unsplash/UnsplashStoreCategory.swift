//
//  UnsplashStoreCategory.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/8.
//

import UIKit

// Unsplash 商店
enum UnsplashStoreCategory {
    case home // Home
    case allProducts // 所有
    case medeByUnsplash // 官方制作
    case madeWithFriends // 同人周边
}

struct StoreItem {
    public var coverImage: UIImage?
    public var title: String?
    public var description: String?
    public var name: String?
    public var state: String?
    public var sizes: [String]?
    public var price: Decimal?

    public var deatilImages: [UIImage]?
    public var username: String?
}

extension UnsplashStoreCategory: RawRepresentable, CaseIterable {

    var rawValue: (key: String, title: String, bannerItems: [StoreItem], items: [StoreItem]) {
        switch self {
        case .home:
            let allItems = UnsplashStoreCategory.allCases
                .filter { $0 != .home && $0 != .allProducts }
                .flatMap { category in category.rawValue.items }
            //let bannerItems = allItems.choose


        case .allProducts:
            <#code#>
        case .medeByUnsplash:
            <#code#>
        case .madeWithFriends:
            <#code#>
        }
    }
}
