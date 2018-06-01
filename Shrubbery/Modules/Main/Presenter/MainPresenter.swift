//
//  MainPresenter.swift
//  Shrubbery
//
//  Created by Jieyi on 15/05/2018.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import CommonUtil
import RxSwift

class MainPresenter: MainPresenterInput {
    var view: MainViewInput!
    var interactor: MainInteractor!
    var router: MainRouterInput!

    func viewIsReady() {
    }

    func getList() {
        interactor
            .getFakeList()
            .subscribe { single in
                switch single {
                    case .success(let entity):
                        logd(entity.description())
                    case .error(let error):
                        loge(error)
                }
            }
            .disposed(by: view.disposable)
    }
}
