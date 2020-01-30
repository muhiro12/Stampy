//
//  API.swift
//  Stampy
//
//  Created by Hiromu Nakano on 2020/01/30.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import Foundation
import Moya

protocol API {
    associatedtype RequestType: TargetType
    func run(type: RequestType)
}

extension API {
    func run(type: RequestType) {
        let provider = MoyaProvider<RequestType>()
        provider.request(type) { result in
            print(result)
        }
    }
}
