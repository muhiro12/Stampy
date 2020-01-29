//
//  Logs.swift
//  Stampy
//
//  Created by Hiromu Nakano on 2020/01/29.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import Foundation

struct Logs: Database {
    typealias DataType = LogData

    enum Time: String {
        case attendance
        case leave
    }

    func save(at time: Logs.Time) {
        let data = LogData()

        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        formatter.locale = Locale(identifier: "ja_JP")

        data.date = formatter.string(from: Date())
        data.type = time.rawValue

        save(data: data)
    }
}
