//
//  ShrubberyRealm.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/22.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RealmSwift
import RxSwift

class ShrubberyRealm: LocalDataService {
    let realm = try! Realm()
    lazy var realmPath = realm.configuration.fileURL!

    func retrieveFakeList() -> Single<FakeEntity> {
        // FIXME: (jieyi 2018/05/22) Fix the object inheritance.
        return Single.just(realm.objects(TempObj.self))
            .map { list -> FakeEntity in
                return FakeEntity(infoList: nil)
            }
    }

    func updateInformation(info entity: InformationEntity) -> Completable {
        // OPTIMIZE: (jieyi 2018/05/22) We can create a good add rx completable method.
        return Completable.create {
            do {
                try self.realm.write {
                    // FIXME: (jieyi 2018/05/22) Fix the object inheritance.
                    self.realm.add(TempObj())
                }
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
                // OPTIMIZE: (jieyi 2018/05/22) We can create a good add rx completable method.
                self.realm.delete(TempObj())
                $0(.completed)
            }
            catch {
                $0(.error(error))
            }

            return Disposables.create()
        }
    }
}

class TempObj: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var name: String = ""
}
