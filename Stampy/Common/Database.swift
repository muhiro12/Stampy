//
//  Database.swift
//  Stampy
//
//  Created by Hiromu Nakano on 2020/01/29.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import Foundation
import RealmSwift

protocol Database {
    associatedtype DataType: Object
    func save(data: DataType)
    func fetch() -> Results<DataType>?
}

extension Database {

    func save(data: DataType) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(data)
            }
        } catch {
            print(error)
        }
    }

    func fetch() -> Results<DataType>? {
        var data: Results<DataType>?
        do {
            let realm = try Realm()
            data = realm.objects(DataType.self)
        } catch {
            print(error)
        }
        return data
    }

}
