//
//  LocalDatabase.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import Foundation
import RxSwift

protocol LocalCoreData {
    func retrieveFakeList() -> Single<[String]>
}