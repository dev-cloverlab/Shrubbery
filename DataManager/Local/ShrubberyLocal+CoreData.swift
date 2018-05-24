//
//  ShrubberyCoreData.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import CoreData
import RxCoreData
import RxSwift

public class ShrubberyCoreData: LocalDataService {
//    @available(iOS 10.0, *)
//    private lazy var coreDataContext: NSManagedObjectContext! = {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        return appDelegate.persistentContainer.viewContext
//    }()
    private var coreDataContext: NSManagedObjectContext!

    public init(content managedObject: NSManagedObjectContext) {
        coreDataContext = managedObject
    }

    public func retrieveFakeList() -> Single<FakeEntity> {
        return coreDataContext.rx
            .entities(InformationEntity.self,
                      sortDescriptors: [NSSortDescriptor(key: Info.updatedDate, ascending: false)])
            .map { list -> FakeEntity in
                var entity = FakeEntity()
                entity.infoList = list
                return entity
            }
            .asSingle() // FIXME: (jieyi 2018/05/22) There're some issues from RxCoreData can't transform to Single.
    }

    public func update(info entity: Info) -> Completable {
        return Completable.create { [weak self] completable in
            guard let stringSelf = self else {
                return Disposables.create()
            }

            do {
                try stringSelf.coreDataContext.rx.update(entity)
                completable(.completed)
            } catch {
                completable(.error(error))
            }

            return Disposables.create()
        }
    }

    public func remove(info entity: Info? = nil) -> Completable {
        return Completable.create { [weak self] completable in
            guard let stringSelf = self else {
                return Disposables.create()
            }

            do {
                if let e = entity {
                    try stringSelf.coreDataContext.rx.delete(e)
                    completable(.completed)
                } else {
                    completable(.error(RxError.noElements))
                }
            } catch {
                completable(.error(error))
            }

            return Disposables.create()
        }
    }
}

public struct ShrubberyCoreDataConstants {
    public static let coredataName = "Shrubbery+CoreData"
}
