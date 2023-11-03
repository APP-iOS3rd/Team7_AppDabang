//
//  EmailView.swift
//  View_Practice01
//
//  Created by lkh on 10/30/23.
//

import SwiftUI


struct EmailView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    @Binding var flag: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("이메일")
                .font(.subheadline)
            HStack {
                TextField(" 이메일을 입력해주세요", text: $viewModel.user.userId)
                    .textInputAutocapitalization(.never)
                    .onTapGesture {
                        flag = true
                    }
                    .onSubmit {
                        viewModel.isValidEmail()
                        if viewModel.emailState != 1 {
                            flag = false
                        }
                    }
                
                if flag  {
                    Button(action: {
                        viewModel.user.userId = ""
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                    })
                } else if viewModel.emailState == 1 {
                    Image(systemName: "exclamationmark.circle")
                        .foregroundColor(.red)
                }
                
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .stroke(
                    viewModel.emailFieldColor(),
                    lineWidth: flag ? 2 : 0
                )
            )
            
            Text(viewModel.heiperEmail)
                .font(.subheadline)
                .foregroundColor(viewModel.emailFieldColor())
        }
    }
}

//#Preview {
//    EmailView()
//}
