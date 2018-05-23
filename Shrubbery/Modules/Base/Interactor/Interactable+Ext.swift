//
//  Interactor.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift
import DataManager

protocol Interactable: class {
    var repository: DataStore! { get set }
}

extension ObservableType {
    public func thruInternet() -> Observable<E> {
        return self
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .userInitiated))
            .observeOn(MainScheduler.instance)
    }
}

extension PrimitiveSequence {
    public func thruInternet() -> PrimitiveSequence<Trait, Element> {
        return self
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .userInitiated))
            .observeOn(MainScheduler.instance)
    }
}
