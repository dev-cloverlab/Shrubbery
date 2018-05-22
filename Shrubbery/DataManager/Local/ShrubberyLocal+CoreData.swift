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

class ShrubberyCoreData: LocalDataService {
    @available(iOS 10.0, *)
    lazy var coreDataContext: NSManagedObjectContext! = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }()

    func retrieveFakeList() -> Single<FakeEntity> {
        return coreDataContext.rx
            .entities(InformationEntity.self,
                      sortDescriptors: [NSSortDescriptor(key: INFO.UPDATE_DATE, ascending: false)])
            .map { list -> FakeEntity in
                var entity = FakeEntity()
                entity.infoList = list
                return entity
            }
            .asSingle()  // FIXME: (jieyi 2018/05/22) There're some issues from RxCoreData can't transform to Single.
    }

    func updateInformation(info entity: InformationEntity) -> Completable {
        return Completable.create {
            do {
                try self.coreDataContext.rx.update(entity)
                $0(.completed)
            }
            catch {
                $0(.error(error))
            }

            return Disposables.create()
        }
    }

    func removeInformation(info entity: InformationEntity? = nil) -> Completable {
        return Completable.create {
            do {
                if let e = entity {
                    try self.coreDataContext.rx.delete(e)
                    $0(.completed)
                }
                else {
                    $0(.error(RxError.noElements))
                }
            }
            catch {
                $0(.error(error))
            }

            return Disposables.create()
        }
    }
}
