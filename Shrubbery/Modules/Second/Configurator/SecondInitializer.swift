//
//  SecondSecondInitializer.swift
//  Shrubbery
//
//  Created by Jieyi on 01/06/2018.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import UIKit

class SecondModuleInitializer: NSObject {
    //Connect with object on storyboard
    @IBOutlet weak var secondViewController: SecondViewController!

    override func awakeFromNib() {

        let configurator = SecondModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: secondViewController)
    }
}
