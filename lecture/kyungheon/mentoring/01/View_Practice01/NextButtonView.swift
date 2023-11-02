//
//  NextButtonView.swift
//  View_Practice01
//
//  Created by lkh on 10/30/23.
//

import SwiftUI

struct NextButtonView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    var w: CGFloat
    var h: CGFloat
    
    var body: some View {
        HStack {
            Spacer()
            
            if viewModel.nextBtnOnOff() {
                nextBtn(flag: $viewModel.nextPage, w: w, h: h) {
                    if viewModel.isPossibleNext() {
                        viewModel.nextPage = true
                    } else {
                        viewModel.alret = true
                    }
                }
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray)
                    .frame(width: w, height: h)
                    .overlay(
                        Text("로그인")
                            .foregroundColor(.white)
                    )
            }
            
            Spacer()
        }
    }
}

struct nextBtn: View {
    @Binding var flag: Bool
    
    var w: CGFloat
    var h: CGFloat
    var check: () -> Void
    
    var body: some View {
        Button("로그인") {
            check()
        }
        .frame(width: w, height: h)
        .padding(5)
        .foregroundColor(Color.white)
        .background(Color.blue)
        .cornerRadius(30)
    }
}
