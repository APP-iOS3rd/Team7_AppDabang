//
//  dummy.swift
//  View_Practice01
//
//  Created by lkh on 10/30/23.
//

import SwiftUI

struct dummy: View {
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    
    @FocusState private var emailFocused: Bool
    @FocusState private var passwordFocused: Bool
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                    VStack(alignment: .leading) {
                            Text("Hello\nWorld !")
                                .font(.system(size: 50, weight: .semibold))
                                .padding()
                        
                        // MARK: - 아이디
                        VStack(alignment: .leading) {
                            Text("이메일")
                                .font(.subheadline)
                            HStack {
                                TextField(" 이메일을 입력해주세요", text: $viewModel.user.userId)
                                    .disableAutocorrection(true)
                                    .focused($emailFocused)
                                    .onSubmit {
                                        emailFunc()
                                    }
                                
                                if emailFocused  {
                                    Button(action: {
                                        viewModel.user.userId = ""
                                    }, label: {
                                        Image(systemName: "xmark")
                                            .foregroundColor(viewModel.emailState == 1 ? .red : .black)
                                    })
                                }
                                else if viewModel.emailState == 1 {
                                    Image(systemName: "exclamationmark.circle")
                                        .foregroundColor(viewModel.emailState == 1 ? .red : .black)
                                }
                                
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .stroke(
                                    viewModel.emailFieldColor(),
                                    lineWidth: (emailFocused || viewModel.emailState == 1) ? 2 : 0
                                )
                            )
                            
                            Text(viewModel.heiperEmail)
                                .font(.subheadline)
                                .foregroundColor(viewModel.emailFieldColor())
                            
                        }
                        .textInputAutocapitalization(.never)
                        .padding()
                        
                        // MARK: - 비밀번호
                        VStack(alignment: .leading) {
                            Text("비밀번호")
                                .font(.subheadline)
                            
                            HStack {
                                SecureField(" 비밀번호을 입력해주세요", text: $viewModel.user.userPassword)
                                    .focused($passwordFocused)
                                    .textInputAutocapitalization(.never)
                                    .disableAutocorrection(true)
                                    .onChange(of: viewModel.user.userPassword) { password in
                                        viewModel.isValidPassword()
                                        
                                    }
                                Image(systemName: "eye.slash")
                                
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .stroke(Color.gray, lineWidth: passwordFocused ? 2 : 0)
                            )
                            
                            HStack {
                                Spacer()
                                ForEach(0..<4, id: \.self) { idx in
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(viewModel.passwordColor(idx))
                                        .frame(width: geometry.size.width / 5, height: geometry.size.height / 70)
                                }
                                Spacer()
                            }
                            
                            Text(viewModel.heiperPassword)
                                .font(.subheadline)
                        }
                        .padding()
                        
                        //Spacer()
                        Spacer(minLength: geometry.size.height/4)
                        
                        // MARK: - 버튼
                        HStack(alignment: .center) {
                            Spacer()
                            
                            if viewModel.nextBtnOnOff() {
                                nextBtn(flag: $viewModel.nextPage, w: geometry.size.width / 1.12, h: geometry.size.height/12) {
                                    if viewModel.isPossibleNext() {
                                        viewModel.nextPage = true
                                    } else {
                                        viewModel.alret = true
                                    }
                                }
                            } else {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.gray)
                                    .frame(width: geometry.size.width / 1.12, height: geometry.size.height / 12)
                                    .overlay(
                                        Text("로그인")
                                            .foregroundColor(.white)
                                    )
                                    .padding()
                            }
                            
                            Spacer()
                        }
                    }
                    NavigationLink(
                        destination: NextView(),
                        isActive: $viewModel.nextPage,
                        label: {
                            EmptyView() // 실제로 보이지 않음
                        }
                    )
                
            }.background(Color("skyblue"))
        }
        .onTapGesture {
            hideKeyboard()
        }
        .alert(isPresented: $viewModel.alret) {
            Alert(title: Text("엥"),
                  message: Text("아이디 혹은 비밀번호가 맞지 않습니다."),
                  dismissButton: .default(Text("확인"))
            )
        }
    }
    
    func emailFunc() {
        emailFocused = false
        passwordFocused = true
        
        viewModel.isValidEmail()
    }
}

extension View {
  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}

#Preview {
    dummy()
}
