//
//  SettingsView.swift
//  ContactContact
//
//  Created by Richard Adem on 7/26/24.
//

import SwiftUI

struct SettingsView: View {
  @Environment(Options.self) private var options: Options
  var body: some View {
    @Bindable var options = options
    VStack(alignment: .leading) {
      Text("Settings").font(.title)
      Form {
        TextField("Host", text: $options.host)
      }
      Button {
      } label: {
        Text("Button")
      }
      .frame(maxWidth: .infinity, alignment: .trailing)
    }
    .padding()
  }
}

#Preview {
  SettingsView()
    .environment(Options())
}
