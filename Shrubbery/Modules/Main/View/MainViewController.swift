//
//  MainViewController.swift
//  Shrubbery
//
//  Created by Jieyi on 15/05/2018.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController, MainViewInput {
    var presenter: MainPresenterInput!
    @IBOutlet weak var kkk: UIButton!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewIsReady()
        logv("vvvvvvvvvvvvvvvvvvv")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        presenter.getList()
    }

    // MARK: MainViewInput
    func setupInitialState() {
    }
}
