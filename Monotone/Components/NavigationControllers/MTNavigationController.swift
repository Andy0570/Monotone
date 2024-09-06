//
//  MTNavigationController.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/29.
//

import UIKit
import RxSwift
import RxRelay
import SnapKit

class MTNavigationController: BaseNavigationController {

    // MARK: - Public
    let bacBtnDidTap: PublishRelay<Void> = PublishRelay<Void>()
    let closeBtnDidTap: PublishRelay<Void> = PublishRelay<Void>()

    // MARK: - Controls
    private var logoBtn: UIButton!
    private var backBtn: UIButton!
    private var closeBtn: UIButton!

    private var logoBarButtonItem: UIBarButtonItem!
    private var backBarButtonItem: UIBarButtonItem!
    private var closeBarButtonItem: UIBarButtonItem!

    // MARK: - Private
    private let disposeBag = DisposeBag()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func buildSubviews() {
        super.buildSubviews()

        // Configure
        updateNavBarTransparent(transparent: false)
        updateNavBarHidden(hidden: false)

        // LogoBtn
        self.logoBtn = UIButton()
        self.logoBtn.setImage(UIImage(named: "unsplash-logo")?.withRenderingMode(.alwaysTemplate), for: .normal)
        self.logoBtn.contentEdgeInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        self.logoBtn.tintColor = ColorPalette.colorBlack
        self.logoBtn.isEnabled = false
        self.logoBtn.snp.makeConstraints { make in
            make.width.height.equalTo(30.0)
        }
        self.logoBarButtonItem = UIBarButtonItem(customView: self.logoBtn)

        // BackBtn
        self.backBtn = UIButton()
        self.backBtn.setImage(UIImage(named: "nav-btn-back")?.withRenderingMode(.alwaysTemplate), for: .normal)
        self.backBtn.contentEdgeInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        self.backBtn.tintColor = ColorPalette.colorBlack
        self.backBtn.isEnabled = false
        self.backBtn.snp.makeConstraints { make in
            make.width.height.equalTo(30.0)
        }
        self.backBarButtonItem = UIBarButtonItem(customView: self.backBtn)

        // CloseBtn
        self.closeBtn = UIButton()
        self.closeBtn.setImage(UIImage(named: "nav-btn-close")?.withRenderingMode(.alwaysTemplate), for: .normal)
        self.closeBtn.contentEdgeInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        self.closeBtn.tintColor = ColorPalette.colorBlack
        self.closeBtn.isEnabled = false
        self.closeBtn.snp.makeConstraints { make in
            make.width.height.equalTo(30.0)
        }
        self.closeBarButtonItem = UIBarButtonItem(customView: self.closeBtn)
    }

    override func buildLogic() {
        super.buildLogic()

        // Buttons
        self.backBtn.rx.tap
            .bind(to: self.bacBtnDidTap)
            .disposed(by: disposeBag)
        
        self.closeBtn.rx.tap
            .bind(to: self.closeBtnDidTap)
            .disposed(by: disposeBag)
    }

    override func updateNavBarTransparent(transparent: Bool) {
        if transparent {
            self.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.view.backgroundColor =  .clear
            self.navigationBar.shadowImage = UIImage()

            self.navigationBar.isTranslucent = true
        } else {
            // 设置导航栏背景颜色
            // barTintColor 属性作用于 navigation bar background
            self.navigationBar.barTintColor = ColorPalette.colorWhite
            // 设置导航栏 item 颜色
            // tintColor 属性作用于 navigation items 和 bar button items
            self.navigationBar.tintColor = ColorPalette.colorBlack
            self.navigationBar.shadowImage = UIImage()

            // 设置导航栏背景是否透明
            self.navigationBar.isTranslucent = false
        }
    }

    override func updateNavBarHidden(hidden: Bool) {
        if hidden {
            setNavigationBarHidden(true, animated: false)
        } else {
            setNavigationBarHidden(false, animated: false)
        }
    }

    override func updateNavItems(color: UIColor? = nil, 
                                 leftItems: [UIBarButtonItem]? = nil,
                                 rightItems: [UIBarButtonItem]? = nil) {
        // LeftBarButtonItems
        if let leftItems {
            self.topViewController?.navigationItem.leftBarButtonItems = leftItems
        } else {
            self.topViewController?.navigationItem.leftBarButtonItems = self.viewControllers.count <= 1 ? [self.logoBarButtonItem] : [self.backBarButtonItem]
        }

        // RightBarButtonItems
        if let rightItems {
            self.topViewController?.navigationItem.rightBarButtonItems = rightItems
        } else {
            self.topViewController?.navigationItem.rightBarButtonItems = self.viewControllers.count <= 1 ? [self.closeBarButtonItem] : [self.logoBarButtonItem]
        }

        // Color
        self.topViewController?.navigationItem.leftBarButtonItems?.forEach { item in
            item.customView?.tintColor = color ?? ColorPalette.colorBlack
        }
        self.topViewController?.navigationItem.rightBarButtonItems?.forEach { item in
            item.customView?.tintColor = color ?? ColorPalette.colorBlack
        }
    }
}
