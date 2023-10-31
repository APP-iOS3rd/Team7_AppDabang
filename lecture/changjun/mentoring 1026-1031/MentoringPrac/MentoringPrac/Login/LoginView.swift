//
//  LoginView.swift
//  MentoringPrac
//
//  Created by phang on 10/28/23.
//

import SwiftUI

// MARK: - Login 화면에서 사용되는 Data

class LoginData: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var passwordHelperText: String = Texts.passwordHelperText.rawValue
    
    @Published var isValidEmail = false
    @Published var isValidPassword = false
    
    @Published var showPassword = false
    
    @Published var progressColorData: [Color] = Array(repeating: .mtGray, count: 4)
    
    @Published var isShowAlert = false
    @Published var alertMessage: String = ""
}


// MARK: - Login

struct LoginView: View {
    @StateObject var loginData: LoginData = LoginData()
    @EnvironmentObject var loginUserData: LoginUserData
        
    var body: some View {
        
        GeometryReader { geo in
            VStack {
                Spacer()
                ZStack(alignment: .top) {
                    
                    // background
                    LoginBackground(geo: geo)
                    
                    VStack(alignment: .leading) {
                        
                        // login Greetings
                        LoginGreeting()
                        
                        // email & password
                        EmailAndPasswordView().environmentObject(loginData)
                        
                        // login Button
                        LoginButton()
                            .environmentObject(loginUserData)
                            .environmentObject(loginData)
                    }
                    .padding(20)
                    
                }
            }
            .ignoresSafeArea()
        }
    }
    
}

#Preview {
    LoginView().environmentObject(LoginUserData())
}
