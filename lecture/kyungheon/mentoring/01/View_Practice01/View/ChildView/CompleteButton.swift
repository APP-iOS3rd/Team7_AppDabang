//
//  CompleteButton.swift
//  View_Practice01
//
//  Created by lkh on 11/6/23.
//

import SwiftUI

// MARK: - 버튼
struct CompleteButton: View {
    @EnvironmentObject var viewModel: LoginViewModel
    @Binding var isComplete: Bool
    
    let geometryWidth: CGFloat
    let geometryHeight: CGFloat
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Spacer()
            
            if viewModel.isBtnActive {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue)
                    .padding()
                    .overlay(
                        Button(action: {
                            isComplete = viewModel.isLoginComplete ? true : false
                            viewModel.alret = !isComplete ? true : false
                        }) {
                            Text("로그인")
                                .foregroundColor(Color.white)
                        }
                    )
                    .frame(width: .infinity, height: geometryHeight / 4)
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray)
                    .overlay(Text("로그인")
                        .foregroundColor(.white))
                    .padding()
                    .frame(width: .infinity, height: geometryHeight / 4)
            }
            Spacer()
        }
    }
}
