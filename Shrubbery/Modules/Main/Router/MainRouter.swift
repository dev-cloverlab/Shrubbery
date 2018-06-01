//
//  MainRouter.swift
//  Shrubbery
//
//  Created by Jieyi on 15/05/2018.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import UIKit

class MainRouter: MainRouterInput {
    func navigateToSecond(vc: UIViewController) {
        let sb = obtain(storyboard: "Main")
        let destination = obtain(viewController: "SecondViewController",
                                 type: SecondViewController.self,
                                 by: sb)

        transition(by: vc, to: destination)
    }
}
