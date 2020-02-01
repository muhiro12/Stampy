//
//  StampView.swift
//  Stampy
//
//  Created by Hiromu Nakano on 2020/01/26.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import SwiftUI

struct StampView: View {
    @State private var isAttendance = StampType.shared == .attendance

    var body: some View {
        VStack(spacing: Self.spaceL) {
            Text("Stampy")
                .font(.largeTitle)

            VStack {
                Image(systemName: "arrowtriangle.up")
                    .imageScale(.small)
                    .foregroundColor(isAttendance ? .gray : .clear)

                Button(action: tapButton) {
                    Text(isAttendance ? "Attendance" : "Leave")
                }.roundedCorners(color: isAttendance ? .blue : .green)
                    .gesture(buttonGesture)

                Image(systemName: "arrowtriangle.down")
                    .imageScale(.small)
                    .foregroundColor(isAttendance ? .clear : .gray)
            }.frame(height: 200)
        }
    }

    private func tapButton() {
        Logs().save(at: isAttendance ? .attendance : .leave)
        StampType.shared.run(type: isAttendance ? .attendance : .leave)
    }

    var buttonGesture: _EndedGesture<DragGesture> {
        return DragGesture().onEnded { (value) in
            self.isAttendance = value.translation.height > 0
        }
    }
}

struct StampView_Previews: PreviewProvider {
    static var previews: some View {
        StampView()
    }
}
