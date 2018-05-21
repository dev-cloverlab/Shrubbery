//
//  ShrubberyCoreData.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import CoreData
import RxSwift
import RxCoreData
import ObjectMapper

class ShrubberyCoreData: LocalCoreData {
    @available(iOS 10.0, *)
    lazy var coreDataContext: NSManagedObjectContext! = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }()

    @available(iOS 10.0, *)
    func retrieveFakeList() -> Single<FakeEntity> {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Fake")
        do {
            try coreDataContext.rx.update(InformationEntity(id: 32, title: "vvvvvvvvvvvv", updatedAt: Date()))
        }
        catch {
        }

        coreDataContext.rx.entities(InformationEntity.self, sortDescriptors: [NSSortDescriptor(key: "updated_at", ascending: false)])
            .subscribe { event in
                logw(event)
            }

        return Single.just(FakeEntity(map: Map(mappingType: .toJSON, JSON: ["123": "123"]))!, scheduler: MainScheduler())
    }
}
