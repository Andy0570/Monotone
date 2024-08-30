//
//  BaseCoordinator.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/28.
//

import UIKit
import RxSwift

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var currentViewController: UIViewController? { get }
}

protocol ViewControllerFactory {
    associatedtype sceneType
    associatedtype sceneContentType

    func viewController(scene: sceneType, with args: [String: Any?]?) -> UIViewController?
}

protocol ViewModelFactory {
    associatedtype sceneType
    associatedtype sceneContentType

    func viewModel(sceneContentType: sceneContentType, with args: [String: Any?]?) -> BaseViewModel?
}

/// 对各个场景之间的“转场方式”进行建模
protocol CoordinatorTransitionable {
    @discardableResult
    func transition(type: SceneTransition, with args: [String: Any?]?, animated: Bool) -> Observable<Void>

    @discardableResult
    func pop(animated: Bool) -> Observable<Void>
}

class BaseCoordinator: Coordinator {

    // MARK: - Public

    var childCoordinators: [Coordinator] = [Coordinator]()
    var window: UIWindow
    weak var currentViewController: UIViewController?

    // MARK: - Life Cycle

    init(window: UIWindow) {
        self.window = window
        self.currentViewController = window.rootViewController
    }

    static func acturalViewController(for viewController: UIViewController) -> UIViewController {
        var vc = viewController

        if let tabBarController = vc as? UITabBarController {
            guard let selectedViewController = tabBarController.selectedViewController else {
                return tabBarController
            }

            vc = selectedViewController
            return acturalViewController(for: vc)
        }

        if let navigationController = vc as? UINavigationController {
            vc = navigationController.viewControllers.first!
            return acturalViewController(for: vc)
        }

        return vc
    }

}
