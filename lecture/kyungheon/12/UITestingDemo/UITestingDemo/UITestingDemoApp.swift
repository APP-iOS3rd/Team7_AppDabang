//
//  UITestingDemoApp.swift
//  UITestingDemo
//
//  Created by lkh on 12/18/23.
//

import SwiftUI

@main
struct UITestingDemoApp: App {
    var user = User()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(user)
        }
    }
}
