//
//  LoginView.swift
//  Stampy
//
//  Created by Hiromu Nakano on 2020/01/26.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import SwiftUI
import SwiftyUserDefaults

struct LoginView: View {

    @Environment(\.presentationMode) private var presentationMode
    @State var userID = ""
    @State var password = ""

    var body: some View {
        Form {
            TextField("Mail address", text: $userID)
                .textContentType(.emailAddress)
                .autocapitalization(.none)

            SecureField("Password", text: $password)

            Button(action: tapButton) {
                Text("Login")
            }
        }
    }

    private func tapButton() {
        guard !userID.isEmpty, !password.isEmpty else {
            return
        }
        Defaults[\.userID] = userID
        Defaults[\.password] = password
        Defaults[\.signedIn] = true
        presentationMode.wrappedValue.dismiss()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
