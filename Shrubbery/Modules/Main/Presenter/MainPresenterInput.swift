//
//  MainViewOutput.swift
//  Shrubbery
//
//  Created by Jieyi on 15/05/2018.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//
protocol MainPresenterInput: Presentable {
    /**
        @author Jieyi
        Notify presenter that view is ready
    */
    func viewIsReady()

    func getList()
}
