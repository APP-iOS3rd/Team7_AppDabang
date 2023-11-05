//
//  ContentView.swift
//  MentoringPrac
//
//  Created by phang on 10/28/23.
//

import SwiftUI

// MARK: - launched | login | main

struct ContentView: View {
    @State private var isLoading = true
    @StateObject private var loginUserData: LoginUserData = LoginUserData()
    
    var body: some View {
        VStack {
            if isLoading {
                LoadingView()
            } else if !loginUserData.isLogin {
                LoginView().environmentObject(loginUserData)
            } else {
                MainView().environmentObject(loginUserData)
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                isLoading = false
            }
        }
    }
}

#Preview {
    ContentView()
}
