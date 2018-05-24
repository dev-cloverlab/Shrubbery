//
//  NetworkConfigurator.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/24.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import DataManager
import Moya
import Swinject

class NetworkConfigurator: Assembly {
    func assemble(container: Container) {

        // MARK: - Necessary Objects

        container.register(MoyaProvider<ShrubberyMoyaConfig>.self) { _ in
            MoyaProvider<ShrubberyMoyaConfig>()
        }

        // MARK: - Provide to the others Assembly

        container.register(RemoteDataService.self, name: "moya") { r in
            ShrubberyMoyaService(r.resolve(MoyaProvider<ShrubberyMoyaConfig>.self)!)
        }
        container.register(RemoteDataService.self, name: "alamofire") { _ in
            ShrubberyAlamofireService()
        }
    }
}
