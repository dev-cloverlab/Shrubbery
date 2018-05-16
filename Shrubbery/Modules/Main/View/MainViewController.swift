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
    var output: MainPresenterInput!
    @IBOutlet weak var kkk: UIButton!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        output.viewIsReady()
    }

    // MARK: MainViewInput
    func setupInitialState() {
    }
}
