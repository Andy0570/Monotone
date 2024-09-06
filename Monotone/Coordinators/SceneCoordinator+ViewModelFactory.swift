//
//  SceneCoordinator+ViewModelFactory.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/28.
//

import Foundation

extension SceneCoordinator: ViewModelFactory {
    func viewModel(sceneContentType: SceneContent, with args: [String : Any?]?) -> BaseViewModel? {
        return BaseViewModel(services: nil, args: nil)
    }
}
