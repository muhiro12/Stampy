//
//  LogData.swift
//  Stampy
//
//  Created by Hiromu Nakano on 2020/01/29.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import Foundation
import RealmSwift

class LogData: Object {
    @objc dynamic var date = ""
    @objc dynamic var type = ""
}
