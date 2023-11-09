//
//  LoginPassword.swift
//  MentoringLoginUI
//
//  Created by 조민식 on 2023/11/01.
//

import SwiftUI

struct LoginPassword: View {
    
    @EnvironmentObject var loginData: LoginData
    @FocusState private var isFocusedPassword
    
    @State private var excellent: Bool = false
    @State private var fine: Bool = false
    @State private var weak: Bool = false
    @State private var bad: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("비밀번호")
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .kerning(0.07)
                Spacer()
            }
            .padding(.horizontal, 16)
            HStack {
                if loginData.showPassword {
                    SecureField("비밀번호를 입력해주세요", text: $loginData.password)
                        .focused($isFocusedPassword)
                        .textInputAutocapitalization(.never)
                        .onChange(of: loginData.password) {
                            loginData.isValidPassword = checkPasswordForm()
                        }
                    Button(action: { loginData.showPassword.toggle() }) {
                        Image(systemName: "eye.slash")
                            .foregroundStyle(Color.black)
                    }
                    
                }
                else {
                    TextField("비밀번호를 입력해주세요", text: $loginData.password)
                        .focused($isFocusedPassword)
                        .textInputAutocapitalization(.never)
                        .onChange(of: loginData.password) {
                            loginData.isValidPassword = checkPasswordForm()
                        }
                    Button(action: { loginData.showPassword.toggle() }) {
                        Image(systemName: "eye")
                            .foregroundStyle(Color.black)
                    }
                }
            }
            .frame(maxWidth: 315, alignment: .leading)
            .padding(.horizontal, 24)
            .padding(.vertical, 16)
            .background(ColorGroup.white)
            .cornerRadius(12)
            .overlay(
            RoundedRectangle(cornerRadius: 12)
            .inset(by: 0.5)
            .stroke(isFocusedPassword ? .black : loginData.loginFalse == true ? ColorGroup.red : ColorGroup.gray, lineWidth: 1)
            )
            HStack {
                Rectangle()
                    .foregroundColor(bad == true ? ColorGroup.red : ColorGroup.gray)
                    .frame(width: 84, height: 1)
                Rectangle()
                    .foregroundColor(weak == true ? ColorGroup.orange : ColorGroup.gray)
                    .frame(width: 84, height: 1)
                Rectangle()
                    .foregroundColor(fine == true ? ColorGroup.orange : ColorGroup.gray)
                    .frame(width: 84, height: 1)
                Rectangle()
                    .foregroundColor(excellent == true ? ColorGroup.green : ColorGroup.gray)
                    .frame(width: 84, height: 1)
            }
            HStack {
                if !loginData.password.isEmpty {
                    Text("Helper text")
                        .font(.system(size: 14))
                        .kerning(0.07)
                        .foregroundStyle(loginData.loginFalse == true ? ColorGroup.red : .black)
                }else{
                    Text("비밀번호를 올바르게 입력해주세요")
                        .font(.system(size: 14))
                        .kerning(0.07)
                        .foregroundStyle(loginData.loginFalse == true ? ColorGroup.red : .black)
                }
                Spacer()
            }
            .padding(.horizontal, 16)
        }
    }
    func checkPasswordForm() -> Bool {
        if loginData.password.wholeMatch(of: Regex.excellentRegex) != nil {
            excellent = true
            fine = true
            weak = true
            bad = true
            return true
        } else if    loginData.password.wholeMatch(of: Regex.fineRegex) != nil {
            excellent = false
            fine = true
            weak = true
            bad = true
            return true
        } else if loginData.password.wholeMatch(of: Regex.weakRegex) != nil {
            excellent = false
            fine = false
            weak = true
            bad = true
            return true
        } else if loginData.password.wholeMatch(of: Regex.badRegex) != nil {
            excellent = false
            fine = false
            weak = false
            bad = true
            return false
        } else {
            excellent = false
            fine = false
            weak = false
            bad = true
            return false
        }
    }
}

#Preview {
    LoginPassword()
}
