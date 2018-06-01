//
//  SecondSecondConfigurator.swift
//  Shrubbery
//
//  Created by Jieyi on 01/06/2018.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import UIKit

class SecondModuleConfigurator: ViperInjector {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? SecondViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: SecondViewController) {
    }
}
