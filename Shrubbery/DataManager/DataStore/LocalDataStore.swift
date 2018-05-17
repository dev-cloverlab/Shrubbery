//
//  LocalDataStore.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import Foundation
import RxSwift

class LocalDataStore: DataStore {
    var localCoreData: LocalCoreData!

    init(coredata local: LocalCoreData) {
        localCoreData = local
    }

    func fetchFakeList() -> Single<[String]> {
        fatalError("fetchWatchList() has not been implemented")
    }
}
