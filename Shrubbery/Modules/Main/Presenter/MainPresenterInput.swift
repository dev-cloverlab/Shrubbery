//
//  MainViewOutput.swift
//  Shrubbery
//
//  Created by Jieyi on 15/05/2018.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import UIKit

protocol MainPresenterInput: Presentable {
    weak var view: MainViewInput! { get set }
    var interactor: MainInteractor! { get set }
    var router: MainRouterInput! { get set }

    func viewIsReady()

    func getList()

    func gotoNext(vc: UIViewController)
}
