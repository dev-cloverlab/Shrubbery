//
//  MainPresenter.swift
//  Shrubbery
//
//  Created by Jieyi on 15/05/2018.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift
import CommonUtil

class MainPresenter: MainPresenterInput {
    weak var view: MainViewInput!
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
                        logw(entity.description())
                    case .error(let error):
                        loge(error)
                }
            }
            .disposed(by: view.disposable)
    }
}
