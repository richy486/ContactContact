//
//  RenderedImage.swift
//  ContactContact
//
//  Created by Richard Adem on 6/27/24.
//

import SwiftUI

struct RenderedImage: View {
  var titleText: String
  let showBorders: Bool
  let showIcon: Bool

  var body: some View {
    let scale = {
      NSScreen.screens.map { $0.backingScaleFactor }.max() ?? 1
    }

    let title = HStack(spacing: 0) {
      if showIcon {
        Image(systemName: "figure.table.tennis")
          .font(.system(size: 30.0))
          .border(showBorders ? .red : .clear)
          .frame(width: 45)
          .offset(x:10)
      }
      HStack {
        Spacer()
        Text(titleText)
          .font(.custom("Futura", size: 30))
          .lineLimit(1)
          .minimumScaleFactor(0.01)

      } // HStack
      .frame(width: 100)
      .border(showBorders ? .green : .clear)
    }
    .border(showBorders ? .orange : .clear)

    let renderer = ImageRenderer(content: title)
    let cgImage = renderer.cgImage

    Image(cgImage!, scale: scale(), label: Text(""))
      .renderingMode(.template)
  }
}
#Preview {
  RenderedImage(titleText: "Hello", showBorders: false, showIcon: true)
}
