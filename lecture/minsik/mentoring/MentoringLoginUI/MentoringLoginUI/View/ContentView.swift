//
//  ContentView.swift
//  MentoringLoginUI
//
//  Created by 조민식 on 2023/11/01.
//

import SwiftUI

class LoginData: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    @Published var isValidEmail = false
    @Published var isValidPassword = false
    
    @Published var loginFalse: Bool = false
    
}

struct ContentView: View {
    @StateObject var loginData: LoginData = LoginData()
    
    var body: some View {
        GeometryReader {geo in
            VStack {
                Spacer().frame(alignment: .bottomLeading)
                ZStack {
                    LoginBackground(geo: geo)
                    VStack(alignment: .leading) {
                        Spacer().frame(height: 60)
                        HStack {
                            LoginTitle()
                        }
                        .padding()
                        Spacer().frame(height: 40)
                        LoginEmail()
                            .environmentObject(loginData)
                        Spacer().frame(height: 20)
                        LoginPassword()
                            .environmentObject(loginData)
                        Spacer().frame(height: 40)
                        LoginButton()
                            .environmentObject(loginData)
                        Spacer()
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
