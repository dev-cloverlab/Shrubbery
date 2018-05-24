//
//  Main.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/24.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import DataManager
import Swinject

protocol ViperInjector: Configurator {
}

extension ViperInjector {
    var viperProvider: Container {
        let repo = assembler.resolver.resolve(DataStore.self, name: "repo")!

        return Container { container in

            // MARK: - Main

            container.register(MainInteractor.self) { _ in
                MainInteractor(repository: repo)
            }
            container.register(MainRouter.self) { _ in
                MainRouter()
            }
            container.register(MainPresenter.self) { (_, viewController: MainViewController) in
                let presenter = MainPresenter()
                presenter.router = container.resolve(MainRouter.self)!
                presenter.interactor = container.resolve(MainInteractor.self)!
                presenter.view = viewController

                return presenter
            }

            // TODO: Add your viper objects below.
        }
    }
}
