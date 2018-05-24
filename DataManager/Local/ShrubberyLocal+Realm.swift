//
//  ShrubberyRealm.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/22.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import RealmSwift
import RxSwift

public class ShrubberyRealm: LocalDataService {
    private var realm: Realm
    private lazy var realmPath = realm.configuration.fileURL!

    public init(_ realm: Realm) {
        self.realm = realm
    }

    public func retrieveFakeList() -> Single<FakeEntity> {
        // FIXME: (jieyi 2018/05/22) Fix the object inheritance.
        return Single.just(realm.objects(TempObj.self))
            .map { list -> FakeEntity in
                return FakeEntity(infoList: nil)
            }
    }

    public func update(info entity: Info) -> Completable {
        // OPTIMIZE: (jieyi 2018/05/22) We can create a good add rx completable method.
        return Completable.create {
            do {
                try self.realm.write {
                    // FIXME: (jieyi 2018/05/22) Fix the object inheritance.
                    self.realm.add(TempObj())
                }
                $0(.completed)
            } catch {
                $0(.error(error))
            }

            return Disposables.create()
        }
    }

    public func remove(info entity: Info? = nil) -> Completable {
        return Completable.create { [weak self] completable in
            guard let strongSelf = self else {
                return Disposables.create()
            }

            do {
                // OPTIMIZE: (jieyi 2018/05/22) We can create a good add rx completable method.
                strongSelf.realm.delete(TempObj())
                completable(.completed)
            } catch {
                completable(.error(error))
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

