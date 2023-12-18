//
//  ContentView.swift
//  UITestingDemo
//
//  Created by lkh on 12/18/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showLogin = false
    // LoginView 에서 했던 것처럼 사용자 EnvironmentObject 속성을 선언
    @EnvironmentObject private var user: User
    
    var body: some View {
        VStack {
            Text( !user.isLoggedin ? "Welcome!" : "Welcome \(user.username)!")
                .font(.title)
            
            Spacer().frame(height:20)
            
            Button {
                // 추거
                if !user.isLoggedin {
                    showLogin = true
                } else {
                    user.logout()
                }
            } label: {
                Text(!user.isLoggedin ? "Login" : "Logout")
            }
            .accessibilityIdentifier("loginButton") // 식별자 추가
            
        }
        .padding()
        // 로그인 시트 표시
        .sheet(isPresented: $showLogin) {
            LoginView()
        }
    }
}

//#Preview {
//    ContentView()
//}
