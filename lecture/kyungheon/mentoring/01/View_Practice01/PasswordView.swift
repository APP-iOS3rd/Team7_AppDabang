//
//  PasswordView.swift
//  View_Practice01
//
//  Created by lkh on 10/30/23.
//

import SwiftUI

struct PasswordView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    @Binding var flag: Bool
    var w: CGFloat
    var h: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("비밀번호")
                .font(.subheadline)
            
            HStack {
                SecureField(" 비밀번호을 입력해주세요", text: $viewModel.user.userPassword)
                    .onTapGesture {
                        flag = true
                    }
                    .textInputAutocapitalization(.never)
                    .onChange(of: viewModel.user.userPassword) { _ in
                        viewModel.isValidPassword()
                    }
                    .onSubmit {
                        flag = false
                    }
                Image(systemName: "eye.slash")
                
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .stroke(Color.black, lineWidth: flag ? 2 : 0)
            )
            
            
            HStack {
                Spacer()
                ForEach(0..<4, id: \.self) { idx in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(viewModel.passwordColor(idx))
                        .frame(width: w, height: h)
                }
                Spacer()
            }
            
            Text(viewModel.heiperPassword)
                .font(.subheadline)
        }
        .onTapGesture {
            flag = false
        }
    }
}


