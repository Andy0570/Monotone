//
//  SceneCoordinator.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/28.
//

import UIKit
import RxSwift
import RxCocoa

enum Scene {
    case login
    case home
    case sideMenu
    case photoList
    case tabBar
    case photoDetails
    case photoInfo
    case photoShare
    case photoAddToCollection
    case photoCreateCollection

    case myPhotos
    case hiring
    case licenses
    case help
    case madeWithUnsplash
    case myProfile

    case store
    case storeDetails
    case wallpapers
    case collections
    case collectionDetails
    case explore
}

enum SceneContent {
    case login
    case home
    case sideMenu
    case photoList
    case tabBar
    case photoDetails
    case photoInfo
    case photoShare
    case photoAddToCollection
    case photoCreateCollection

    case myPhotos
    case hiring
    case licenses
    case help
    case madeWithUnsplash
    case myProfile

    case store
    case storeDetails
    case wallpapers
    case collections
    case collectionDetails
    case explore

    case empty
}

final class SceneCoordinator: BaseCoordinator, CoordinatorTransitionable {
    typealias sceneType = Scene
    typealias sceneContentType = SceneContent

    // MARK: - Single Skeleton
    static var shared: SceneCoordinator!

    // MARK: - Public
    override var currentViewController: UIViewController? {
        didSet {
            currentViewController?.navigationController?.delegate = self
            currentViewController?.tabBarController?.delegate = self

            currentViewController?.presentationController?.delegate = self
            currentViewController?.navigationController?.presentationController?.delegate = self
            currentViewController?.tabBarController?.presentationController?.delegate = self
        }
    }

    // MARK: - Private
    private let disposeBag = DisposeBag()

    // FIXME: To finish.
    @discardableResult
    func transitionToTabBar() -> Observable<Void> {
        let subject = PublishSubject<Void>()

        return subject.asObservable().take(1)
    }

    @discardableResult
    func transition(type: SceneTransition, with args: [String : Any?]?, animated: Bool) -> Observable<Void> {
        let subject = PublishSubject<Void>()

        switch type {
        case .root(let scene, let wrapped):
            var targetVC = viewController(scene: scene, with: args)!
            if wrapped {
                let navigationController = MTNavigationController(rootViewController: targetVC)
                configureNavBar(navigationController: navigationController)
                targetVC = navigationController
            }

            currentViewController = SceneCoordinator.acturalViewController(for: targetVC)
            window.rootViewController = targetVC
            subject.onCompleted()
        case .push(let scene):
            let targetVC = viewController(scene: scene, with: args)!

            if let navigationController = currentViewController?.navigationController {
                _ = navigationController.rx.delegate
                    .sentMessage(#selector(navigationController(_:didShow:animated:)))
                    .map{ _ in return () }
                    .bind(to: subject)

                navigationController.pushViewController(SceneCoordinator.acturalViewController(for: targetVC), animated: animated)
            } else {
                let navigationController = MTNavigationController(rootViewController: targetVC)
                navigationController.modalPresentationStyle = .fullScreen

                configureNavBar(navigationController: navigationController)
                _ = navigationController.rx.delegate
                    .sentMessage(#selector(navigationController(_:didShow:animated:)))
                    .map{ _ in return () }
                    .bind(to: subject)

                currentViewController!.present(navigationController, animated: animated) {
                    subject.onCompleted()
                }
                currentViewController = SceneCoordinator.acturalViewController(for: targetVC)
            }
        case .present(let scene, let presentationStyle, let wrapped):
            var targetVC = viewController(scene: scene, with: args)!
            if wrapped {
                let navigationController = MTNavigationController(rootViewController: targetVC)
                configureNavBar(navigationController: navigationController)
                targetVC = navigationController
            }
            targetVC.modalPresentationStyle = presentationStyle

            currentViewController?.present(targetVC, animated: animated, completion: {
                subject.onCompleted()
            })
            currentViewController = SceneCoordinator.acturalViewController(for: targetVC)
        }

        return subject.asObservable().take(1)
    }

    @discardableResult
    func pop(animated: Bool = false) -> Observable<Void> {
        let subject = PublishSubject<Void>()

        /**
         如果「当前视图控制器」存在「导航视图控制器」，并且该「导航视图控制器」下有「多个视图控制器」，
         则让「导航视图控制器」自动调用 navigationController(_:didShow:animated:) 方法，
         后者会自动更新 'currentViewController' 参数
         */
        if let navigationController = currentViewController?.navigationController,
           navigationController.viewControllers.count > 1 {

             _ = navigationController.rx.delegate
                .sentMessage(#selector(navigationController(_:didShow:animated:)))
                .map{ _ in return () }
                .bind(to: subject)
            
            guard navigationController.popViewController(animated: animated) != nil else {
                fatalError("Could not navigate back from current view controller.")
            }
        } else if let presentingViewController = self.currentViewController?.presentingViewController {
            /**
             如果当前视图控制器存在「呈现视图控制器」，即它自身是一个「被呈现视图控制器」，
             那么当「当前视图控制器」被 dismiss 后，「呈现视图控制器」就作为「当前视图控制器」存在。
             */
            currentViewController?.dismiss(animated: true, completion: {
                self.currentViewController = SceneCoordinator.acturalViewController(for: presentingViewController)

                if let vc = presentingViewController as? ViewControllerPresentable {
                    vc.didDismissPresentingViewController(presentationController: presentingViewController.presentationController)
                }
            })
        } else {
            fatalError("Could not pop back from current view controller.")
        }

        return subject.asObservable().take(1)
    }

    /// 配置导航栏：当点击导航栏关闭或返回按钮时，自动推出当前页面
    func configureNavBar(navigationController: MTNavigationController) {
        Observable.of(navigationController.closeBtnDidTap, navigationController.bacBtnDidTap)
            .merge()
            .subscribe(onNext: { [weak self] _ in
                guard let self else { return }

                self.pop(animated: true)
            })
            .disposed(by: disposeBag)
    }
}

extension SceneCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        currentViewController = SceneCoordinator.acturalViewController(for: viewController)
    }
}

extension SceneCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if let topVC = viewController as? BaseViewController,
           let navVC = navigationController as? BaseNavigationController {
            navVC.updateNavBarTransparent(transparent: topVC.navBarTransparent)
            navVC.updateNavBarHidden(hidden: topVC.navBarHidden)
            navVC.updateNavItems(color: topVC.navBarItemsColor)
        }
    }

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        currentViewController = SceneCoordinator.acturalViewController(for: viewController)
    }
}

extension SceneCoordinator: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        // When the presented ViewController dismissed.
        // 当「被呈现视图控制器」页面关闭时，当前视图控制器就是「呈现视图控制器」
        currentViewController = SceneCoordinator.acturalViewController(for: presentationController.presentingViewController)
    }
}
