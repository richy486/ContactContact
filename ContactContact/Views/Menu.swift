//
//  Menu.swift
//  ContactContact
//
//  Created by Richard Adem on 6/20/24.
//

import SwiftUI

struct Menu: View {
  @Environment(\.openWindow) var openWindow
  @Environment(Options.self) private var options: Options

  var body: some View {
    @Bindable var options = options
    Toggle("Show borders", isOn: $options.showBorders)
    Toggle("Show icon", isOn: $options.showIcon)
    Divider()
    Button("Settings…") {
      NSApplication.shared.activate(ignoringOtherApps: true)
      openWindow(id: GlobalConstants.settingsWindowId)
    }
    Button("Quit") {
      exit(0)
    }
  }
}

#Preview {
  Menu()
    .environment(Options())
}
