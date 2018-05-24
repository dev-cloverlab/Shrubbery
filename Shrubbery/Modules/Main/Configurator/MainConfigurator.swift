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

class MainModuleConfigurator: ViperInjector {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? MainViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: MainViewController) {

        // MARK: - Data Manager

        let presenter = viperProvider.resolve(MainPresenter.self, argument: viewController)!
        viewController.presenter = presenter
    }
}
