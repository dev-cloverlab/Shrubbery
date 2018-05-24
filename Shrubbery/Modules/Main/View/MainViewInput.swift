//
//  MainViewInput.swift
//  Shrubbery
//
//  Created by Jieyi on 15/05/2018.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift

protocol MainViewInput: Viewable {
    var disposable: DisposeBag { get }

    /**
     Setup initial state of the view
     */
    func setupInitialState()
}
