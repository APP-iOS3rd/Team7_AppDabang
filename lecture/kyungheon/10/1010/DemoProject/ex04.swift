//
//  ex04.swift
//  DemoProject
//
//  Created by lkh on 10/10/23.
//

import SwiftUI

struct ex04: View {
    @State var a: String = ""
    @State var btnFlag: Bool = false;
    @State var res: Int = 0
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                TextField("num = ", text:$a)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    btnCheck()
                    }, label: {
                        Text("실행")
                            .padding()
                            .background(
                                Capsule().strokeBorder()
                            )
                            .foregroundColor(.white)
                })
            }
            .padding(50)
            .background(Color.indigo)
            // 눌렀다면
            if btnFlag {
                
                Text("결과?: \(res)")
            }
        }
    }
    
    func btnCheck() {
        //btnFlag = btnFlag ? false : true
        if a.count == 0 {
            btnFlag = false
        }
        
        if let convertedNumber = Int(a) {
            btnFlag = true
            res = convertedNumber - convertedNumber % 10 + 1
        } else {
            btnFlag = false
        }
    }
}

#Preview {
    ex04()
}
