//
//  ex09.swift
//  DemoProject
//
//  Created by lkh on 10/12/23.
//

import SwiftUI

struct ex09: View {
    @State private var t: String = ""
    @State private var res: String = ""
    @State private var btnFlag: Bool = false;
    @State private var animationRotateAmount: CGFloat = 0.0 // 애니메이션 효과
    
    var body: some View {
        if self.t.isEmpty {
            self.btnFlag = false;
            print("비어있음")
        }
        
        return VStack {
            Text("Ex-09")
            HStack {
                TextField("정수를 입력하세요", text: $t)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: buttonPressed, label: { Text("Send")})
                        .foregroundColor(.white)
            }
            
            if (btnFlag) {
                Text(t + "는(은) " + res + "입니다.")
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(btnFlag ? animationRotateAmount : 0), anchor: .center)
                    .onAppear {
                        if btnFlag {
                            withAnimation {
                                self.animationRotateAmount += 360
                            }
                        }
                    }
            }
        }
        .modifier(StandardTitle())
    }
    
    func buttonPressed() {
        if let convertedT = Int(t) {
            btnFlag = true
            res = convertedT % 2 == 0 ? "짝수" : "홀수"
        } else {
            btnFlag = false
        }
     }
}

#Preview {
    ex09()
}
