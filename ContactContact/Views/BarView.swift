//
//  BarView.swift
//  ContactContact
//
//  Created by Richard Adem on 6/20/24.
//

import SwiftUI

struct BarView: View {
  @State var viewModel = BarViewModel()
  @Environment(Options.self) private var options

  var title: String {
    switch viewModel.value {
      case .success(let timeInterval):
        "\(timeInterval.millisecond)ms"
      case .failure(let error):
        switch error {
          case .failure:
            "‼"
          case .failToSend:
            "⚠"
          case .unexpectedPacked:
            "⁇"
        }
    }
  }

  var body: some View {
    VStack {
      RenderedImage(titleText: title,
                showBorders: options.showBorders,
                showIcon: options.showIcon)
    }
  }
}

#Preview {
  BarView()
    .environment(Options())
}
