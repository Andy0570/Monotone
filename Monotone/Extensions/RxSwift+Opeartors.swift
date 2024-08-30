//
//  RxSwift+Opeartors.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/13.
//

import RxSwift
import RxRelay

/// 2-way Binding，双向绑定
infix operator <=> : DefaultPrecedence
func <=> <T: Equatable>(observableA: BehaviorRelay<T>, observableB: BehaviorRelay<T>) -> Disposable {

    let a2bDispose = observableA.bind(to: observableB)
    let b2aDispose = observableB
        .distinctUntilChanged()
        .subscribe(onNext: { n in
            observableA.accept(n)
        }, onCompleted:  {
            a2bDispose.dispose()
        })

    return Disposables.create(a2bDispose, b2aDispose)
}
