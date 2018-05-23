//
//  MainConfigurator.swift
//  Shrubbery
//
//  Created by Jieyi on 15/05/2018.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import UIKit
import RealmSwift
import CoreData
import Moya
import DataManager

class MainModuleConfigurator {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? MainViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: MainViewController) {
        // MARK: - Data Manager
        let coreDataContext: NSManagedObjectContext! = {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return appDelegate.persistentContainer.viewContext
        }()
        let coredata = ShrubberyCoreData(content: coreDataContext)
        let realm = ShrubberyRealm(try! Realm())
        let alamofireRemote = ShrubberyAlamofireService()
        let moyaRemote = ShrubberyMoyaService(MoyaProvider<ShrubberyMoyaConfig>())
        let repository = DataRepository(local: LocalDataStore(coredata: coredata, realm: realm),
                                        remote: RemoteDataStore(alamofire: alamofireRemote, moya: moyaRemote))

        let interactor = MainInteractor(repository: repository)
        let router = MainRouter()
        let presenter = MainPresenter()

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        viewController.presenter = presenter
    }
}
