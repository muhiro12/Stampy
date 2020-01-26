//
//  SettingsView.swift
//  Stampy
//
//  Created by Hiromu Nakano on 2020/01/26.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import SwiftUI

struct SettingsView: View {

    @State private var isPresented = false

    var body: some View {
        VStack {
            Text("Your Account")

            Button(action: tapButton) {
                Text("Login")
            }
        }.sheet(isPresented: $isPresented) {
            LoginView()
        }
    }

    private func tapButton() {
        isPresented.toggle()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
