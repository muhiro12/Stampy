//
//  DefaultsKeysExtension.swift
//  Stampy
//
//  Created by Hiromu Nakano on 2020/01/27.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {
    var userID: DefaultsKey<String?> { return .init("userID") }
    var password: DefaultsKey<String?> { return .init("password") }
    var signedIn: DefaultsKey<Bool> { return .init("signedIn", defaultValue: false) }
}
