//
//  LoginEmail.swift
//  MentoringLoginUI
//
//  Created by 조민식 on 2023/11/01.
//

import SwiftUI

struct LoginEmail: View {
    
    @EnvironmentObject var loginData: LoginData
    
    @FocusState var isFocusedEmail
    
    var body: some View {
        
        VStack {
            HStack {
                Text("이메일")
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .kerning(0.07)
                Spacer()
            }
            .padding(.horizontal, 16)
            HStack {
                TextField("이메일을 입력해주세요", text: $loginData.email)
                    .focused($isFocusedEmail)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .onChange(of: loginData.email) {
                        loginData.isValidEmail = checkEmailForm()
                    }
                if isFocusedEmail {
                    Button(action: { eraseEmail() }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                    }
                } else {
                    if loginData.loginFalse == true {
                        Image(systemName: "exclamationmark.circle")
                            .foregroundStyle(ColorGroup.red)
                    }
                }
            }
            .frame(width: 315, alignment: .leading)
            .padding(.vertical, 16)
            .padding(.horizontal, 24)
            .background(ColorGroup.white)
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12)
                .inset(by: 0.5)
                .stroke(isFocusedEmail ? .black : (loginData.loginFalse == true ? ColorGroup.red : ColorGroup.gray), lineWidth:  1)
            )
            HStack {
                if !loginData.email.isEmpty, loginData.isValidEmail {
                    Text("Helper text")
                        .font(.system(size: 14))
                        .kerning(0.07)
                        .foregroundStyle(loginData.loginFalse == true ? ColorGroup.red : .black)
                }else{
                    Text("이메일을 올바르게 입력해주세요")
                        .font(.system(size: 14))
                        .kerning(0.07)
                        .foregroundStyle(loginData.loginFalse == true ? ColorGroup.red : .black)
                }
                Spacer()
            }
            .padding(.horizontal, 16)
        }
    }
    
    func eraseEmail() {
        loginData.email = ""
    }
    
    func checkEmailForm() -> Bool {
        let check = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let test = NSPredicate(format: "SELF MATCHES %@", check)
        return test.evaluate(with: loginData.email)
    }
    
}


#Preview {
    LoginEmail()
}
