//
//  ex10.swift
//  DemoProject
//
//  Created by lkh on 10/12/23.
//

import SwiftUI

struct ex10: View {
    @State private var t1: String = ""
    @State private var t2: String = ""
    @State private var res: String = ""
    @State private var isSee: Bool = false;
    @State private var animationRotateAmount: CGFloat = 0.0 // 애니메이션 효과
    
    var body: some View {
        return VStack {
            Text("Ex-10")
                VStack {
                    TextField("첫 번째 정수 입력:", text: $t1)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("두 번째 정수 입력:", text: $t2)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .onSubmit {
                    guard !t1.isEmpty && !t2.isEmpty else { 
                        isSee = false
                        return
                    }
                    sol()
                    isSee = true
            }
            
            if (isSee) {
                Text("두 수의 차: " + res)
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(isSee ? animationRotateAmount : 0), anchor: .center)
                    .onAppear {
                        if isSee {
                            withAnimation {
                                self.animationRotateAmount += 360
                            }
                        }
                    }
            }
        }
        .modifier(StandardTitle())
    }
    
    func sol() {
        if let convertedT1 = Int(t1) {
            if let covertedT2 = Int(t2) {
                res = String(convertedT1 < covertedT2 ? covertedT2 - convertedT1 : convertedT1 - covertedT2)
            }
        }
     }
}

#Preview {
    ex10()
}
