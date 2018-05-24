//
//  Configurator.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/24.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import Swinject

protocol Configurator {
}

extension Configurator {
    fileprivate var parentContainer: Container {
        let container = Container { _ in
        }

        return container
    }
}
