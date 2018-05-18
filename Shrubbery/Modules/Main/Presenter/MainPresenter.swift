//
//  MainPresenter.swift
//  Shrubbery
//
//  Created by Jieyi on 15/05/2018.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift

class MainPresenter: MainPresenterInput {
    weak var view: MainViewInput!
    var interactor: MainInteractorInput!
    var router: MainRouterInput!

    func viewIsReady() {
    }

    func getList() {
        interactor.getFakeList().subscribe { single in
            logw(single)
            switch single {
                case .success(let entity):
                    entity.toShowAll()
                case .error(let error):
                    loge(error)
            }
        }
    }
}
