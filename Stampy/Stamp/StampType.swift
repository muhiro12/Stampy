//
//  StampType.swift
//  Stampy
//
//  Created by Hiromu Nakano on 2020/01/30.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import Foundation
import Moya
import SwiftyUserDefaults

enum StampType: String, API {
    typealias RequestType = StampType

    case attendance
    case leave

    static var shared: StampType {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let now = formatter.string(from: date)
        if "03:00" < now && now < "15:00" {
            return .attendance
        } else {
            return .leave
        }
    }
}

extension StampType: TargetType {
    var baseURL: URL {
        return URL(string: Environments.apiURL)!
    }

    var path: String {
        switch self {
        case .attendance:
            return "/attendance"
        case .leave:
            return "/leave"
        }
    }

    var method: Moya.Method {
        return .post
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        let userID = Defaults[\.userID] ?? ""
        let password = Defaults[\.password] ?? ""
        return .requestJSONEncodable(UserInfo(userID: userID, password: password))
    }

    var headers: [String: String]? {
        return [
            "Content-Type": "application/json",
            "X-API-Key": Environments.apiKey
        ]
    }
}

struct UserInfo: Codable {
    let userID: String
    let password: String
}
