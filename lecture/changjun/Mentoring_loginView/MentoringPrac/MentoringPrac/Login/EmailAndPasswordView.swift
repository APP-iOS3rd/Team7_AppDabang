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
    @FocusState var focusedField: FocusField?
    
    private let progressWidth = 0.25
    private let progressCol: [GridItem] = [
        GridItem(.flexible()), GridItem(.flexible()),
        GridItem(.flexible()), GridItem(.flexible())
    ]
    
    var body: some View {
        Group {
            // email
            Text(Texts.email.rawValue)
                .font(.system(size: Texts.email.size))
                .foregroundStyle(Color.mtMainText)
            HStack {
                TextField("", text: $loginData.email,
                          prompt: Text(Texts.emailPlaceHolder.rawValue)
                                    .foregroundStyle(Color.mtGray))
                    .foregroundStyle(Color.mtMainText)
                    .focused($focusedField, equals: .email)
                    .textInputAutocapitalization(.never)
                    .onChange(of: loginData.email) {
                        loginData.isValidEmail = checkEmailForm()
                    }
                if !loginData.email.isEmpty {
                    Button(action: {
                        eraseEmail()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundStyle(Color.black)
                    }
                }
            }
            .modifier(MentoringTextField(focused: focusedField == .email))
            if !loginData.email.isEmpty, !loginData.isValidEmail {
                Text(Texts.emailHelperText.rawValue)
                    .foregroundStyle(Color.mtMainText)
                    .font(.system(size: Texts.email.size))
                    .opacity(1.0)
                    .padding(.bottom, 10)
            } else {
                Text(Texts.emailHelperText.rawValue)
                    .foregroundStyle(Color.mtMainText)
                    .font(.system(size: Texts.email.size))
                    .opacity(0.0)
                    .padding(.bottom, 10)
            }
            // password
            Text(Texts.password.rawValue)
                .font(.system(size: Texts.password.size))
                .foregroundStyle(Color.mtMainText)
            HStack {
                if loginData.showPassword {
                    TextField("", text: $loginData.password,
                              prompt: Text(Texts.passwordPlaceHolder.rawValue)
                                        .foregroundStyle(Color.mtGray))
                        .foregroundStyle(Color.mtMainText)
                        .focused($focusedField, equals: .password)
                        .textInputAutocapitalization(.never)
                        .onChange(of: loginData.password) {
                            (loginData.isValidPassword, loginData.passwordHelperText) = checkPasswordForm()
                        }
                        .disabled(!loginData.isValidEmail)
                } else {
                    SecureField("", text: $loginData.password,
                                prompt: Text(Texts.passwordPlaceHolder.rawValue)
                                          .foregroundStyle(Color.mtGray))
                        .foregroundStyle(Color.mtMainText)
                        .focused($focusedField, equals: .password)
                        .textInputAutocapitalization(.never)
                        .onChange(of: loginData.password) {
                            (loginData.isValidPassword, loginData.passwordHelperText) = checkPasswordForm()
                        }
                        .disabled(!loginData.isValidEmail)
                }
                Button(action: {
                    loginData.showPassword.toggle()
                }) {
                    Image(systemName: loginData.showPassword ? "eye.slash" : "eye")
                        .foregroundStyle(Color.black)
                }
            }
            .modifier(MentoringTextField(focused: focusedField == .password))
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
            Text("\(loginData.passwordHelperText)")
                .foregroundStyle(Color.mtMainText)
                .font(.system(size: Texts.password.size))
                .opacity(loginData.password.isEmpty ? 0.0 : 1.0)
                .padding(.bottom, 20)
        }
        .onSubmit {
            switch focusedField {
            case .email:
                focusedField = .password
            case .password:
                focusedField = nil
            default:
                print("Done")
            }
        }
    }
    
    private func eraseEmail() {
        loginData.email = ""
    }
    
    private func checkEmailForm() -> Bool {
        guard let _ = loginData.email.wholeMatch(of: Constants.emailRegex) else { return false }
        return true
    }
    
    private func checkPasswordForm() -> (Bool, String) {
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
    VStack(alignment: .leading) {
        EmailAndPasswordView()
            .environmentObject(LoginData())
    }
    .padding()
}
