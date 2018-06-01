//
//  View.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift

protocol Viewable: class {
    var disposable: DisposeBag { get set }
}
