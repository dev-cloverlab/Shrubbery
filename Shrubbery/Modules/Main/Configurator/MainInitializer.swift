//
//  MainInitializer.swift
//  Shrubbery
//
//  Created by Jieyi on 15/05/2018.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import UIKit

class MainModuleInitializer: NSObject {
    // Connect with object on storyboard
    @IBOutlet var mainViewController: MainViewController!

    override func awakeFromNib() {
        let configurator = MainModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: mainViewController)
    }
}
