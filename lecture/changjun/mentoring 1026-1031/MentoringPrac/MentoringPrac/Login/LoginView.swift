//
//  LoginView.swift
//  MentoringPrac
//
//  Created by phang on 10/28/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var passwordHelperText: String = Texts.passwordHelperText.rawValue
    
    @State private var isValidEmail = false
    @State private var isValidPassword = false
    
    @FocusState private var isFocusedEmail
    @FocusState private var isFocusedPassword
    
    @State private var showPassword = false
    
    @State private var isShowAlert = false
    @State private var alertMessage: String = ""
    
    @EnvironmentObject var loginData: LoginData
    
    private var isLoginButton: Bool { showLoginButton() }
    private let progressWidth = 0.25
    private let progressCol: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @State private var progressColorData: [Color] = Array(repeating: .mtGray, count: 4)
        
    var body: some View {
        
        GeometryReader { geo in
            VStack {
                Spacer()
                
                ZStack(alignment: .top) {
                    
                    BackgroundView(geo: geo)

                    
                    VStack(alignment: .leading) {
                        
                        // login Greetings
                        Text(Texts.loginGreetings.rawValue)
                            .font(.system(size: Texts.loginGreetings.size))
                            .fontWeight(.bold)
                            .padding(.vertical, 40)
                        
                        // email
                        Group {
                            Text(Texts.email.rawValue)
                                .font(.system(size: Texts.email.size))
                            HStack {
                                TextField(Texts.emailPlaceHolder.rawValue, text: $email)
                                    .focused($isFocusedEmail)
                                    .textInputAutocapitalization(.never)
                                    .onChange(of: email) {
                                        isValidEmail = checkEmailForm()
                                    }
                                if isFocusedEmail {
                                    Button(action: { eraseEmail() }) {
                                        Image(systemName: "xmark")
                                            .foregroundStyle(Color.black)
                                    }
                                }
                            }
                            .modifier(MentoringTextField(isFocused: isFocusedEmail))
                            if !email.isEmpty, !isValidEmail {
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
                        }
                        
                        // password
                        Group {
                            Text(Texts.password.rawValue)
                                .font(.system(size: Texts.password.size))
                            HStack {
                                if showPassword {
                                    TextField(Texts.passwordPlaceHolder.rawValue, text: $password)
                                        .focused($isFocusedPassword)
                                        .textInputAutocapitalization(.never)
                                        .onChange(of: password) {
                                            (isValidPassword, passwordHelperText) = checkPasswordForm()
                                        }
                                        .disabled(!isValidEmail)
                                    Button(action: { self.showPassword.toggle() }) {
                                        Image(systemName: "eye.slash")
                                            .foregroundStyle(Color.black)
                                    }
                                } else {
                                    SecureField(Texts.passwordPlaceHolder.rawValue, text: $password)
                                        .focused($isFocusedPassword)
                                        .textInputAutocapitalization(.never)
                                        .onChange(of: password) {
                                            (isValidPassword, passwordHelperText) = checkPasswordForm()
                                        }
                                        .disabled(!isValidEmail)
                                    Button(action: { self.showPassword.toggle() }) {
                                        Image(systemName: "eye")
                                            .foregroundStyle(Color.black)
                                    }
                                }
                            }
                            .modifier(MentoringTextField(isFocused: isFocusedPassword))
                            LazyVGrid(columns: progressCol, spacing: 10) {
                                ForEach(progressColorData.indices, id: \.self) { index in
                                    VStack {
                                        Rectangle()
                                            .stroke(progressColorData[index], lineWidth: 2)
                                            .frame(height: 0.5)
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity)
                            if !password.isEmpty, isFocusedPassword {
                                Text("\(passwordHelperText)")
                                    .font(.system(size: Texts.password.size))
                                    .opacity(1.0)
                                    .padding(.bottom, 20)
                            } else {
                                Text("\(passwordHelperText)")
                                    .font(.system(size: Texts.password.size))
                                    .opacity(0.0)
                                    .padding(.bottom, 20)
                            }
                        }
                        
                        // login Button
                        HStack {
                            Button(action: {
                                (loginData.isLogin, alertMessage) = login()
                                if loginData.isLogin {
                                    // Login Success -> Next View
                                    print("LOGIN !!")
                                } else {
                                    isShowAlert = true
                                }
                            }, label: {
                                Text(Texts.login.rawValue)
                                    .foregroundStyle(Color.white)
                                    .font(.system(size: Texts.login.size))
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity)
                            })
                            .disabled(!isLoginButton)
                            .alert(alertMessage, isPresented: $isShowAlert, actions: {
                                Button("OK", role: .cancel) {
                                    eraseWrongData()
                                }
                            })
                        }
                        .padding(.vertical, 12)
                        .background(isLoginButton ? Color.mtAccent : Color.mtGray)
                        .cornerRadius(10)
                    }
                    .padding(20)
                    
                }
            }
            .ignoresSafeArea()
        }
    }
    
    func eraseEmail() {
        self.email = ""
    }
    
    func checkEmailForm() -> Bool {
        guard let _ = self.email.wholeMatch(of: Constants.emailRegex) else { return false }
        return true
    }
        
    func checkPasswordForm() -> (Bool, String) {
        if self.password.wholeMatch(of: Constants.excellentPasswordRegex) != nil {
            self.progressColorData = [.mtRed, .mtOrange, .mtOrange, .mtGreen]
            return (true, Texts.passwordHelperText4.rawValue)
        } else if self.password.wholeMatch(of: Constants.finePasswordRegex) != nil {
            self.progressColorData = [.mtRed, .mtOrange, .mtOrange, .mtGray]
            return (true, Texts.passwordHelperText3.rawValue)
        } else if self.password.wholeMatch(of: Constants.weakPasswordRegex) != nil {
            self.progressColorData = [.mtRed, .mtOrange, .mtGray, .mtGray]
            return (true, Texts.passwordHelperText2.rawValue)
        } else if self.password.wholeMatch(of: Constants.badPasswordRegex) != nil {
            self.progressColorData = [.mtRed, .mtGray, .mtGray, .mtGray]
            return (false, Texts.passwordHelperText1.rawValue)
        } else {
            self.progressColorData = [.mtGray, .mtGray, .mtGray, .mtGray]
            return (false, Texts.passwordHelperText.rawValue)
        }
    }
    
    func showLoginButton() -> Bool {
        isValidEmail && isValidPassword
    }
    
    func login() -> (Bool, String) {
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
    
    func confirmSubscriptionAndCorrectPassword() throws {
        for user in AppDabangUsers().users {
            if self.email == user.email {
                if self.password == user.password {
                    loginData.userName = user.userName
                    return
                } else {
                    throw LoginError.wrongPassword
                }
            }
        }
        throw LoginError.wrongEmail
    }
    
    func eraseWrongData() {
        self.password = ""
        self.progressColorData = [.mtGray, .mtGray, .mtGray, .mtGray]

        switch self.alertMessage {
        case LoginError.wrongPassword.msg:
            break
        default:
            self.email = ""
        }
    }
    
}

#Preview {
    LoginView().environmentObject(LoginData())
}
