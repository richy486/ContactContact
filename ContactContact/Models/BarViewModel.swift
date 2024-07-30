//
//  BarViewModel.swift
//  ContactContact
//
//  Created by Richard Adem on 6/27/24.
//

import Foundation

@Observable class BarViewModel: NSObject {
  var value: Result<TimeInterval, ContactError> = .success(1)

  enum ContactError: Error {
    case failure
    case failToSend
    case unexpectedPacked
  }

  private var startDate = Date()
  private var timer: Timer?
  private var pinger: SimplePing

  override init() {
    pinger = SimplePing(hostName: "apple.com")
    super.init()
    pinger.addressStyle = .icmPv4
    pinger.delegate = self
    pinger.start()
  }

  func fireTimer() throws {
    if let timer {
      timer.invalidate()
    }

    timer = Timer(timeInterval: 1.0, repeats: true) { [weak self] newTimer in
      guard let strongSelf = self else { return }
      Task {
        strongSelf.pinger.send(with: nil)
      }
    }
    if let timer {
      RunLoop.current.add(timer, forMode: .common)
    }
  }

}

extension BarViewModel: SimplePingDelegate {
  func simplePing(_ pinger: SimplePing, didStartWithAddress address: Data) {
    try? fireTimer()
  }

  func simplePing(_ pinger: SimplePing, didSendPacket packet: Data, sequenceNumber: UInt16) {
    startDate = Date()
  }

  func simplePing(_ pinger: SimplePing, 
                  didReceivePingResponsePacket packet: Data,
                  sequenceNumber: UInt16) {
    value = .success(Date.now.timeIntervalSince(startDate))
  }

  func simplePing(_ pinger: SimplePing, didFailWithError error: any Error) {
    value = .failure(ContactError.failure)
  }

  func simplePing(_ pinger: SimplePing, 
                  didFailToSendPacket packet: Data,
                  sequenceNumber: UInt16,
                  error: any Error) {
    value = .failure(ContactError.failToSend)
  }

  func simplePing(_ pinger: SimplePing, didReceiveUnexpectedPacket packet: Data) {
    value = .failure(ContactError.unexpectedPacked)
  }
}
