//
//  LoginButton.swift
//  MentoringLoginUI
//
//  Created by 조민식 on 2023/11/01.
//

import SwiftUI

struct LoginButton: View {
    @EnvironmentObject var loginData: LoginData
    private var possibleLogin: Bool = false
    
    var body: some View {
        
        HStack {
            Button(action: onButton, label: {
                Text("로그인")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
            })
            .disabled(!loginData.isValidPassword)
            .alert(isPresented: $loginData.loginFalse){
                Alert(title: Text("로그인 실패"), message: Text("아이디 혹은 비밀번호가 맞지 않습니다"), dismissButton: .default(Text("확인")))
            }
        }
        .frame(maxWidth: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .padding(.vertical, 12)
        .background(loginData.isValidPassword == true && loginData.isValidEmail == true ?  ColorGroup.blue : ColorGroup.gray)
        .cornerRadius(10)
        .padding(.horizontal, 16)
    }
    
    func onButton() {
        let user = Users().users
        if loginData.email == user[0].email && loginData.password == user[0].password {
            loginData.loginFalse = false
            
        } else {
            loginData.loginFalse = true
        }
    }
}

#Preview {
    LoginButton()
}
