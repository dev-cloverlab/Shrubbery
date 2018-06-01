//
//  MainRouterInput.swift
//  Shrubbery
//
//  Created by Jieyi on 15/05/2018.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import Foundation
import UIKit

protocol MainRouterInput: Routable {
    func navigateToSecond(vc: UIViewController)
}
