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
    static let shared = SceneCoordinator()

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

        return subject.asObservable().take(1)
    }

    @discardableResult
    func pop(animated: Bool) -> Observable<Void> {
        let subject = PublishSubject<Void>()

        return subject.asObservable().take(1)
    }

    func configureNavBar(navigationController: MTNavigationController) {
        
    }

}
