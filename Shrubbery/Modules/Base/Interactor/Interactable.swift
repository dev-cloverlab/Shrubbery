//
//  Interactor.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import DataManager

protocol Interactable: class {
    var repository: DataStore! { get set }
}
