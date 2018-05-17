//
//  DataRepository.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import Foundation

class DataRepository: DataStore {
    var local: DataStore!
    var remote: DataStore!

    init(local localStore: DataStore, remote remoteStore: DataStore) {
        local = localStore
        remote = remoteStore
    }
}
