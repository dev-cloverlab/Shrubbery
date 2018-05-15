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
    var output: MainViewOutput!
    @IBOutlet weak var kkk: UIButton!
    @IBOutlet weak var ggg: UITableView!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    @IBAction func kkkTouchDown(_ sender: Any) {
        logw("hello world")
    }

    // MARK: MainViewInput
    func setupInitialState() {
    }
}
