//
//  MainViewController.swift
//  Shrubbery
//
//  Created by Jieyi on 15/05/2018.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class MainViewController: UIViewController, MainViewInput {
    var presenter: MainPresenterInput!
    var disposable = DisposeBag()
    @IBOutlet weak var btnGoToNext: UIButton!
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewIsReady()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        presenter.getList()
    }

    // MARK: - MainViewInput

    func setupInitialState() {
    }
}
