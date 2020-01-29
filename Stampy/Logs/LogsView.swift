//
//  LogsView.swift
//  Stampy
//
//  Created by Hiromu Nakano on 2020/01/26.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import SwiftUI

struct LogsView: View {

    var body: some View {
        List {
            ForEach(logs, id: \.self) { log in
                HStack {
                    Text(log.date)
                    Text(log.type)
                }
            }
        }
    }

    var logs: [LogData] {
        let database = Logs()
        if let logs = database.fetch() {
            return logs.reversed()
        } else {
            return []
        }
    }
}

struct LogsView_Previews: PreviewProvider {
    static var previews: some View {
        LogsView()
    }
}
