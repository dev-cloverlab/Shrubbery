//
//  MainConfigurator.swift
//  Shrubbery
//
//  Created by Jieyi on 15/05/2018.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import UIKit

class MainModuleConfigurator {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? MainViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: MainViewController) {
        // MARK: Data Manager
        let local = ShrubberyCoreData()
        let remote = ShrubberyService()
        let repository = DataRepository(local: LocalDataStore(coredata: local), remote: RemoteDataStore(remote: remote))

        let interactor = MainInteractor(repository: repository)
        let router = MainRouter()
        let presenter = MainPresenter()

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        viewController.presenter = presenter
    }
}
