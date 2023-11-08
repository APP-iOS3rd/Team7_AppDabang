//
//  MentoringAPIApp.swift
//  MentoringAPI
//
//  Created by phang on 11/8/23.
//

import SwiftUI

@main
struct MentoringAPIApp: App {
    @State private var isLoading = true
    
    var body: some Scene {
        WindowGroup {
            VStack {
                if isLoading {
                    LauchedView()
                } else {
                    StartingView()
                }
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    isLoading = false
                }
            }
        }
    }
}
