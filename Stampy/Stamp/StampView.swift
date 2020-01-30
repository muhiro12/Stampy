//
//  StampView.swift
//  Stampy
//
//  Created by Hiromu Nakano on 2020/01/26.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import SwiftUI

struct StampView: View {
    var body: some View {
        VStack {
            Text("Title")

            VStack {
                Image(systemName: "arrowtriangle.up")
                    .imageScale(.small)

                Button(action: tapButton) {
                    Text("Button")
                }

                Image(systemName: "arrowtriangle.down")
                    .imageScale(.small)
            }
        }
    }

    private func tapButton() {
        Logs().save(at: Logs.Time.leave)
        StampType.shared.run(type: .attendance)
    }
}

struct StampView_Previews: PreviewProvider {
    static var previews: some View {
        StampView()
    }
}
