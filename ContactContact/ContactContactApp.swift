//
//  ContactContactApp.swift
//  ContactContact
//
//  Created by Richard Adem on 6/19/24.
//

import SwiftUI

@main struct ContactContactApp: App {
  @State private var options = Options()
  
  var body: some Scene {
    MenuBarExtra {
      Menu()
        .environment(options)
    } label: {
      BarView()
        .environment(options)
    }

    Window("Settings", id: GlobalConstants.settingsWindowId) {
      SettingsView()
        .environment(options)
    }
    .windowResizability(.contentSize)
  }
}

enum PingError: Error {
  case invalidURL
  case badStatus
}
