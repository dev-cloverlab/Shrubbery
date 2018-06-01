//
//  SecondSecondViewController.swift
//  Shrubbery
//
//  Created by Jieyi on 01/06/2018.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RxSwift
import UIKit

class SecondViewController: UIViewController, SecondViewInput {
    var presenter: SecondPresentInput!
    var disposable = DisposeBag()

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: SecondViewInput

    func setupInitialState() {
    }
}
