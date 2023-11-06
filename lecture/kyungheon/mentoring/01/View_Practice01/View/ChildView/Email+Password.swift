//
//  Email+Password.swift
//  View_Practice01
//
//  Created by lkh on 11/6/23.
//

import SwiftUI

struct Email_Password: View {
    @EnvironmentObject var viewModel: LoginViewModel
    @FocusState var focusedField: Field?
    @Binding var isComplete: Bool
    
    var body: some View {
        VStack {
            // MARK: - email
            VStack(alignment: .leading, spacing: 10) {
                Text("이메일")
                    .font(.subheadline)
                
                TextField(" 이메일을 입력해주세요", text: $viewModel.user.userId)
                    .focused($focusedField, equals: .email)
                    .textFieldStyle(EmailTextFieldStyle(
                        inputEmail: $viewModel.user.userId,
                        focusField: focusedField,
                        emailState: viewModel.emailState)
                    )
                    .onSubmit {
                        viewModel.emailState = viewModel.updateEmailState
                        focusedField = viewModel.emailState == .success ? .password : .email
                    }
                
                Text(viewModel.heiperEmail)
                    .font(.subheadline)
                    .foregroundColor(viewModel.emailState == .fail ? .red : .black)
            }
            .padding()
            
            // MARK: - password
            VStack(alignment: .leading, spacing: 10) {
                Text("비밀번호")
                    .font(.subheadline)
                
                SecureField(" 비밀번호을 입력해주세요", text: $viewModel.user.userPassword)
                    .focused($focusedField, equals: .password)
                    .textFieldStyle(PasswordTextFieldStyle(
                        inputPassword: $viewModel.user.userPassword,
                        focusField: focusedField,
                        passwordState: viewModel.passwordState)
                    )
                    .onChange(of: viewModel.user.userPassword) { _ in
                        viewModel.passwordState = viewModel.updatePasswordState
                    }
                    .onSubmit {
                        if viewModel.isBtnActive {
                            isComplete = viewModel.isLoginComplete ? true : false
                            viewModel.alret = !isComplete ? true : false
                        }
                    }
                
                Text(viewModel.heiperPassword)
                    .font(.subheadline)
            }
            .padding()
        }
        .onTapGesture {
            focusedField = nil
        }
    }
}

