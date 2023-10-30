//
//  LoginView.swift
//  View_Practice01
//
//  Created by lkh on 10/30/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    @State private var flag1 = Bool()
    @State private var flag2 = Bool()

    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(alignment: .leading) {
                    Text("Hello\nWorld !")
                        .font(.system(size: 60, weight: .semibold))
                        .padding()
                    
                    EmailView(flag: $flag1)
                        .padding()
                        .onTapGesture {
                            flag2 = false
                        }
                    
                    PasswordView(flag: $flag2, w: geometry.size.width / 5, h: geometry.size.height / 70)
                        .padding()
                        .onTapGesture {
                            flag1 = false
                        }
                    
                    Spacer()
                    
                    NextButtonView(w: geometry.size.width / 2, h: geometry.size.width / 10)
                    
                    NavigationLink(
                        destination: NextView(),
                        isActive: $viewModel.nextPage,
                        label: {
                            EmptyView()
                        }
                    )
                }
                .background(Color("skyblue"))
            }
            .onTapGesture {
                flag1 = false
                flag2 = false
            }
        }
        .alert(isPresented: $viewModel.alret) {
            Alert(
                title: Text("엥"),
                message: Text("아이디 혹은 비밀번호가 맞지 않습니다."),
                dismissButton: .default(Text("확인"))
            )
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewModel())
}
