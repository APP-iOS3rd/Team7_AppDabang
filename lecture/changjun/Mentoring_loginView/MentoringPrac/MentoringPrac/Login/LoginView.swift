//
//  LoginView.swift
//  MentoringPrac
//
//  Created by phang on 10/28/23.
//

import SwiftUI

// MARK: - Login

struct LoginView: View {
    @StateObject var loginData: LoginData = LoginData()
    @EnvironmentObject var loginUserData: LoginUserData
    @FocusState var focusedField: FocusField?
        
    var body: some View {
        VStack {
            Spacer()
            LoginBackground()
                .overlay {
                    VStack(alignment: .leading) {
                        LoginGreeting()
                        EmailAndPasswordView(focusedField: _focusedField)
                            .environmentObject(loginData)
                        LoginButton()
                            .environmentObject(loginUserData)
                            .environmentObject(loginData)
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                    .background(Color.mtBackground)
                    .padding(20)
                }
        }
        .onTapGesture {
            hideKeyboard(focusedField: focusedField)
        }
        .ignoresSafeArea()
    }
    
    private func hideKeyboard(focusedField: FocusField?) {
        self.focusedField = nil
    }
}

#Preview {
    LoginView().environmentObject(LoginUserData())
}
