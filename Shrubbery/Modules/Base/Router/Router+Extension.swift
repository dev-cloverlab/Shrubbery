//
//  Extension.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/31.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import UIKit

extension Routable {
    fileprivate func transition(by viewController: UIViewController, to destination: UIViewController) {
        guard let navigator = viewController.navigationController else {
            viewController.present(destination, animated: true)
            return
        }

        navigator.pushViewController(destination, animated: true)
    }

    fileprivate func obtain(storyboard identifier: String, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: identifier, bundle: bundle)
    }

    fileprivate func obtain<VC: UIViewController>(viewController identifier: String,
                                                  type of: VC.Type,
                                                  by storyboard: UIStoryboard,
                                                  bundle: Bundle? = nil) -> VC {
        if let vc = storyboard.instantiateViewController(withIdentifier: identifier) as? VC {
            return vc
        }

        fatalError("There's no UIViewController.")
    }
}
