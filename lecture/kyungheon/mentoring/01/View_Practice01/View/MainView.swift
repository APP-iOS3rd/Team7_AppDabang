//
//  MainView.swift
//  View_Practice01
//
//  Created by lkh on 11/6/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: LoginViewModel = LoginViewModel()
    @State private var isComplete: Bool = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(alignment: .center, spacing: 0) {
                    Spacer()
                        .frame(width: geometry.size.width, height: geometry.size.height / 12)
                    
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 40.0)
                            .fill(Color("skyblue"))
                            .ignoresSafeArea()
                        
                        Login(isComplete: $isComplete,
                               geometryWidth: geometry.size.width,
                               geometryHeight: geometry.size.width)
                            .environmentObject(viewModel)
                    }
                }
                .alert(isPresented: $viewModel.alret) {
                    Alert(title: Text("로그인 실패"),
                          message: Text("아이디 혹은 비밀번호가 맞지 않습니다."),
                          dismissButton: .default(Text("확인"))
                    )
                }
            }
        }
    }
}



#Preview {
    MainView()
}
