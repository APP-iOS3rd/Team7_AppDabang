//
//  ContentView.swift
//  MentoringPrac
//
//  Created by phang on 10/28/23.
//

import SwiftUI

class LoginData: ObservableObject {
    @Published var isLogin = false
    @Published var userName: String?
}

struct ContentView: View {
    @State var isLoading = true
    
    @StateObject var loginData: LoginData = LoginData()
    
    var body: some View {
        VStack {
            if isLoading {
                LoadingView()
            } else if !loginData.isLogin {
                LoginView().environmentObject(loginData)
            } else {
                MainView().environmentObject(loginData)
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
