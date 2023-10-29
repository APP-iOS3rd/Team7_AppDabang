//
//  ObservableDemo + TimerData.swift
//  DemoProject2
//
//  Created by phang on 10/26/23.
//

import SwiftUI
import Foundation

class TimerData: ObservableObject {
    @Published var timeCount = 0
    
    var timer: Timer?
    
    init() {
        self.timer = Timer.scheduledTimer(timeInterval: 1,
                                          target: self,
                                          selector: #selector(timerDidFire),
                                          userInfo: nil,
                                          repeats: true)
    }
    
    @objc func timerDidFire() {
        timeCount += 1
    }
    
    func resetCount() {
        timeCount = 0
    }
    
}
