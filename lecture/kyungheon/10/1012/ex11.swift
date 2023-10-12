//
//  ex11.swift
//  DemoProject
//
//  Created by lkh on 10/12/23.
//

import SwiftUI

struct ex11: View {
    @State private var t1: String = ""
    @State private var res: String = ""
    @State private var isSee: Bool = false;
    @State private var animationRotateAmount: CGFloat = 0.0 // 애니메이션 효과
    
    var body: some View {
        return VStack {
            Text("Ex-11")
            TextField("농구공의 개수를 입력:", text: $t1)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onSubmit {
                    guard !t1.isEmpty else {
                        isSee = false
                        return
                    }
                    sol()
                    isSee = true
            }
            
            if (isSee) {
                Text("필요한 상자의 수: " + res)
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
        if let convertedT1 = Double(t1) {
            res = String(Int(ceil(convertedT1 / 5.0)))
        }
     }
}

#Preview {
    ex11()
}
