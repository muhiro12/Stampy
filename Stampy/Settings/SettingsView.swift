//
//  SettingsView.swift
//  Stampy
//
//  Created by Hiromu Nakano on 2020/01/26.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import SwiftUI
import SwiftyUserDefaults

struct SettingsView: View {

    @State private var isPresented = false
    @State private var signedIn = false

    var body: some View {
        VStack {
            Text(Defaults[\.userID] ?? "Please sign in...")

            Button(action: tapButton) {
                Text(signedIn ? "Sign out" : "Sing in")
            }
        }.onAppear {
            self.updateSignedInState()
        }.sheet(isPresented: $isPresented, onDismiss: updateSignedInState) {
            LoginView()
        }
    }

    private func tapButton() {
        if signedIn {
            signedIn.toggle()
            Defaults.removeAll()
        } else {
            isPresented.toggle()
        }
    }

    private func updateSignedInState() {
        self.signedIn = Defaults[\.signedIn]
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
