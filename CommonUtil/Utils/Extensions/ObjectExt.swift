//
//  ObjectExt.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import Foundation

public protocol HasStandard {
}

extension HasStandard {
    @inline(__always) func apply(closure: (Self) -> ()) -> Self {
        closure(self)

        return self
    }

    @inline(__always) func run<T>(closure: (Self) -> (T)) -> T {
        return closure(self)
    }
}

extension NSObject: HasStandard {
}

public func unwrap<T>(any: T) -> Any {
    let mirror = Mirror(reflecting: any)

    guard mirror.displayStyle == .optional,
          let first = mirror.children.first else {
        return any
    }

    return first.value
}
