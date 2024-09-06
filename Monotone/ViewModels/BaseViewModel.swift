//
//  BaseViewModel.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/29.
//

import Foundation
import RxSwift

protocol ViewModelServable {
    init(services: [BaseService]?, args: [String: Any?]?)

    var services: [BaseService]? { get }
    func service<T: BaseService>(type: T.Type) -> T?
}

extension ViewModelServable where Self: BaseViewModel {
    /// 根据 class 类型找到相应的服务类型实例
    func service<T: BaseService>(type: T.Type) -> T? where T: BaseService {
        return self.services?.find(by: type)
    }
}

protocol ViewModelStreamable {
    associatedtype InputType
    associatedtype OutputType

    var input: InputType { get }
    var output: OutputType { get }
}

extension ViewModelStreamable where Self: BaseViewModel {

}

class BaseViewModel: ViewModelServable {
    let disposeBag = DisposeBag()

    // MARK: - ViewModelStreamable

    var services: [BaseService]?

    required init(services: [BaseService]?, args: [String: Any?]?) {
        self.services = services
        
        inject(args: args)
        bind()
    }

    func inject(args: [String: Any?]?) {
        fatalError("Subclass should implement this method.")
    }

    func bind() {
        fatalError("Subclass should implement this method.")
    }
}
