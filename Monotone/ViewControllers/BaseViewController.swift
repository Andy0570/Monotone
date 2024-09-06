//
//  BaseViewController.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/29.
//

import UIKit
import RxSwift

protocol ViewControllerBindable {
    
    // Stored ViewModels.
    var viewModels: [BaseViewModel]? { get }

    // Bind to ViewController.
    func bind(to viewModels: [BaseViewModel]?)
    // Retrieve ViewModels.
    func viewModel<T: BaseViewModel>(type: T.Type) -> T?
}

extension ViewControllerBindable where Self: BaseViewController {
    func bind(to viewModels: [BaseViewModel]?) {
        self.viewModels = viewModels
    }

    func viewModel<T: BaseViewModel>(type: T.Type) -> T? where T: BaseViewModel {
        self.viewModels?.find(by: type)
    }
}

protocol ViewControllerTransitionable {
    @discardableResult 
    func transition(type: SceneTransition, with args: [String: Any?]?, animated: Bool) -> Observable<Void>

    @discardableResult 
    func pop() -> Observable<Void>
}

extension ViewControllerTransitionable where Self: BaseViewController {
    @discardableResult 
    func transition(type: SceneTransition, with args: [String: Any?]?, animated: Bool) -> Observable<Void> {
        return SceneCoordinator.shared.transition(type: type, with: args, animated: animated)
    }

    @discardableResult 
    func pop() -> Observable<Void> {
        return SceneCoordinator.shared.pop()
    }
}

protocol ViewControllerAnimatable {
    associatedtype AnimationStateType

    func animation(animationState: AnimationStateType)
}
let viewControllerBuildAnimation = "buildAnimation"

protocol ViewControllerWithAnimator {
    func buildAnimator()
}
let viewControllerBuildAnimator = "buildAnimator"

protocol ViewControllerPresentable {
    func didDismissPresentingViewController(presentationController: UIPresentationController?)
}

class BaseViewController: UIViewController, ViewControllerBindable, ViewControllerTransitionable {
    // MARK: - Public
    var navBarTransparent: Bool = false
    var navBarHidden: Bool = false
    var navBarItemsColor: UIColor = ColorPalette.colorBlack

    var viewModels: [BaseViewModel]?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        buildSubviews()
        buildLogic()

        // Call buildAnimation method of the subclass.
        if self.responds(to: Selector(viewControllerBuildAnimation)) {
            perform(Selector(viewControllerBuildAnimation))
        }

        // Call buildAnimator method of the subclass.
        if self.responds(to: Selector(viewControllerBuildAnimator)) {
            perform(Selector(viewControllerBuildAnimator))
        }
    }

    func buildSubviews() {
        fatalError("Subclass should implement this method.")
    }

    func buildLogic() {
        fatalError("Subclass should implement this method.")
    }

    // MARK: - TouchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        // Resign keyboard when touched.
        UIApplication.shared.sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
