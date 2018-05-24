//
//  MainConfigurator.swift
//  Shrubbery
//
//  Created by Jieyi on 15/05/2018.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import CoreData
import DataManager
import Moya
import RealmSwift
import UIKit

class MainModuleConfigurator: Configurator {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? MainViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: MainViewController) {

        // MARK: - Data Manager

        let repository = provider.resolver.resolve(DataStore.self, name: "repo")!

        let interactor = MainInteractor(repository: repository)
        let router = MainRouter()
        let presenter = MainPresenter()

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        viewController.presenter = presenter
    }
}
