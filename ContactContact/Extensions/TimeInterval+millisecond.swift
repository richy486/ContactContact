//
//  TimeInterval+millisecond.swift
//  ContactContact
//
//  Created by Richard Adem on 6/27/24.
//

import Foundation

extension TimeInterval {

  var millisecond: Int {
    Int((self*1000).truncatingRemainder(dividingBy: 1000))
  }
}
