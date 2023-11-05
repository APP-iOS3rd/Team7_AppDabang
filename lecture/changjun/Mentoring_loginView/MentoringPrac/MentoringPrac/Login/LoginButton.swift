//
//  LoginButton.swift
//  MentoringPrac
//
//  Created by phang on 10/31/23.
//

import SwiftUI

// MARK: - Login Button

struct LoginButton: View {
    @EnvironmentObject var loginUserData: LoginUserData
    @EnvironmentObject var loginData: LoginData
    
    private var isLoginButton: Bool { 
        showLoginButton()
    }
    
    var body: some View {
        HStack {
            Button(action: {
                (loginUserData.isLogin, loginData.alertMessage) = login()
                if !loginUserData.isLogin {
                    loginData.isShowAlert = true
                }
            }, label: {
                Text(Texts.login.rawValue)
                    .foregroundStyle(Color.white)
                    .font(.system(size: Texts.login.size))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
            })
            .disabled(!isLoginButton)
            .alert(loginData.alertMessage,
                   isPresented: $loginData.isShowAlert,
                   actions: {
                Button("OK", role: .cancel) {
                    eraseWrongData()
                }
            })
        }
        .padding(.vertical, 12)
        .background(isLoginButton ? Color.mtAccent : Color.mtGray)
        .cornerRadius(10)
    }
    
    private func showLoginButton() -> Bool {
        loginData.isValidEmail && loginData.isValidPassword
    }
    
    private func login() -> (Bool, String) {
        do {
            try confirmSubscriptionAndCorrectPassword()
        } catch LoginError.wrongEmail {
            return (false, LoginError.wrongEmail.msg)
        } catch LoginError.wrongPassword {
            return (false, LoginError.wrongPassword.msg)
        } catch {
            fatalError("An unknown error occurred")
        }
        return (true, "")
    }
    
    private func confirmSubscriptionAndCorrectPassword() throws {
        for user in AppDabangUsers().users {
            if loginData.email == user.email {
                if loginData.password == user.password {
                    loginUserData.userName = user.userName
                    return
                } else {
                    throw LoginError.wrongPassword
                }
            }
        }
        throw LoginError.wrongEmail
    }
    
    private func eraseWrongData() {
        loginData.password = ""
        loginData.progressColorData = [.mtGray, .mtGray, .mtGray, .mtGray]
        if loginData.alertMessage != LoginError.wrongPassword.msg {
            loginData.email = ""
        }
    }
}

#Preview {
    LoginButton()
        .environmentObject(LoginUserData())
        .environmentObject(LoginData())
}
