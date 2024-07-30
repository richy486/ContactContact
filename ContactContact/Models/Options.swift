//
//  Options.swift
//  ContactContact
//
//  Created by Richard Adem on 6/21/24.
//

import Foundation

@Observable class Options {
  var showBorders: Bool {
    didSet {
      UserDefaults.standard.setValue(showBorders, forKey: "showBorders")
    }
  }
  var showIcon: Bool {
    didSet {
      UserDefaults.standard.setValue(showIcon, forKey: "showIcon")
    }
  }
  var host: String {
    didSet {
      UserDefaults.standard.setValue(host, forKey: "host")
    }
  }

  init() {
    showBorders = UserDefaults.standard.bool(forKey: "showBorders")
    showIcon = UserDefaults.standard.value(forKey: "showIcon") != nil
      ? UserDefaults.standard.bool(forKey: "showIcon")
      : true
    host = UserDefaults.standard.string(forKey: "host") ?? "apple.com"
  }
}
