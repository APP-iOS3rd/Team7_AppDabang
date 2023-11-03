//
//  EmailView.swift
//  MentoringPrac
//
//  Created by phang on 10/31/23.
//

import SwiftUI

// MARK: - Login Email / Password 입력

struct EmailAndPasswordView: View {
    @EnvironmentObject var loginData: LoginData
    
    @FocusState var isFocusedEmail
    @FocusState var isFocusedPassword
    
    let progressWidth = 0.25
    private let progressCol: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        Group {
            // email
            Text(Texts.email.rawValue)
                .font(.system(size: Texts.email.size))
            HStack {
                TextField(Texts.emailPlaceHolder.rawValue, text: $loginData.email)
                    .focused($isFocusedEmail)
                    .textInputAutocapitalization(.never)
                    .onChange(of: loginData.email) {
                        loginData.isValidEmail = checkEmailForm()
                    }
                if isFocusedEmail {
                    Button(action: { eraseEmail() }) {
                        Image(systemName: "xmark")
                            .foregroundStyle(Color.black)
                    }
                }
            }
            .modifier(MentoringTextField(isFocused: isFocusedEmail))
            if !loginData.email.isEmpty, !loginData.isValidEmail {
                Text(Texts.emailHelperText.rawValue)
                    .font(.system(size: Texts.email.size))
                    .opacity(1.0)
                    .padding(.bottom, 10)
            } else {
                Text(Texts.emailHelperText.rawValue)
                    .font(.system(size: Texts.email.size))
                    .opacity(0.0)
                    .padding(.bottom, 10)
            }
            
            // password
            Text(Texts.password.rawValue)
                .font(.system(size: Texts.password.size))
            HStack {
                if loginData.showPassword {
                    TextField(Texts.passwordPlaceHolder.rawValue, text: $loginData.password)
                        .focused($isFocusedPassword)
                        .textInputAutocapitalization(.never)
                        .onChange(of: loginData.password) {
                            (loginData.isValidPassword, loginData.passwordHelperText) = checkPasswordForm()
                        }
                        .disabled(!loginData.isValidEmail)
                    Button(action: { loginData.showPassword.toggle() }) {
                        Image(systemName: "eye.slash")
                            .foregroundStyle(Color.black)
                    }
                } else {
                    SecureField(Texts.passwordPlaceHolder.rawValue, text: $loginData.password)
                        .focused($isFocusedPassword)
                        .textInputAutocapitalization(.never)
                        .onChange(of: loginData.password) {
                            (loginData.isValidPassword, loginData.passwordHelperText) = checkPasswordForm()
                        }
                        .disabled(!loginData.isValidEmail)
                    Button(action: { loginData.showPassword.toggle() }) {
                        Image(systemName: "eye")
                            .foregroundStyle(Color.black)
                    }
                }
            }
            .modifier(MentoringTextField(isFocused: isFocusedPassword))
            LazyVGrid(columns: progressCol, spacing: 10) {
                ForEach(loginData.progressColorData.indices, id: \.self) { index in
                    VStack {
                        Rectangle()
                            .stroke(loginData.progressColorData[index], lineWidth: 2)
                            .frame(height: 0.5)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            if !loginData.password.isEmpty, isFocusedPassword {
                Text("\(loginData.passwordHelperText)")
                    .font(.system(size: Texts.password.size))
                    .opacity(1.0)
                    .padding(.bottom, 20)
            } else {
                Text("\(loginData.passwordHelperText)")
                    .font(.system(size: Texts.password.size))
                    .opacity(0.0)
                    .padding(.bottom, 20)
            }
        }
    }
    
    func eraseEmail() {
        loginData.email = ""
    }
    
    func checkEmailForm() -> Bool {
        guard let _ = loginData.email.wholeMatch(of: Constants.emailRegex) else { return false }
        return true
    }
    
    func checkPasswordForm() -> (Bool, String) {
        if loginData.password.wholeMatch(of: Constants.excellentPasswordRegex) != nil {
            loginData.progressColorData = [.mtRed, .mtOrange, .mtOrange, .mtGreen]
            return (true, Texts.passwordHelperText4.rawValue)
        } else if loginData.password.wholeMatch(of: Constants.finePasswordRegex) != nil {
            loginData.progressColorData = [.mtRed, .mtOrange, .mtOrange, .mtGray]
            return (true, Texts.passwordHelperText3.rawValue)
        } else if loginData.password.wholeMatch(of: Constants.weakPasswordRegex) != nil {
            loginData.progressColorData = [.mtRed, .mtOrange, .mtGray, .mtGray]
            return (true, Texts.passwordHelperText2.rawValue)
        } else if loginData.password.wholeMatch(of: Constants.badPasswordRegex) != nil {
            loginData.progressColorData = [.mtRed, .mtGray, .mtGray, .mtGray]
            return (false, Texts.passwordHelperText1.rawValue)
        } else {
            loginData.progressColorData = [.mtGray, .mtGray, .mtGray, .mtGray]
            return (false, Texts.passwordHelperText.rawValue)
        }
    }
}

#Preview {
    EmailAndPasswordView().environmentObject(LoginData())
}
