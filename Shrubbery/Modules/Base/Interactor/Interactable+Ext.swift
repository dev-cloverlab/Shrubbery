//
//  Interactor.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift

protocol Interactable: class {
}

extension ObservableType {
    func thruInternet() -> Observable<E> {
        return self
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .userInitiated))
            .observeOn(MainScheduler.instance)
    }
}

extension PrimitiveSequence {
    func thruInternet() -> PrimitiveSequence<Trait, Element> {
        return self
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .userInitiated))
            .observeOn(MainScheduler.instance)
    }
}
