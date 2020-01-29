//
//  ContentView.swift
//  Stampy
//
//  Created by Hiromu Nakano on 2020/01/26.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var selection = 2

    var body: some View {
        TabView(selection: $selection) {
            LogsView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Logs")
            }.tag(1)

            StampView()
                .tabItem {
                    Image(systemName: "s.square.fill")
                    Text("Stamp")
            }.tag(2)

            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
            }.tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
