//
//  ex01.swift
//  DemoProject
//
//  Created by lkh on 10/10/23.
//

import SwiftUI

struct ex01: View {
    @State var a: String = ""
    @State var b: String = ""
    @State var btnFlag: Bool = false;
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                TextField("수 입력", text:$a)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("수 입력", text:$b)
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
                    Text("더하기 결과: \(Int(a)!+Int(b)!)")
                    .padding(10)
                
                    Text("빼기 결과: \(Int(a)!-Int(b)!)")
                    .padding(10)
                    Text("곱하기 결과: \(Int(a)!*Int(b)!)")
                    .padding(10)
                    Text("나누기 결과: \(Double(a)!/Double(b)!)")
                    .padding(10)
            }
        }
    }
    func btnCheck() {
        //btnFlag = btnFlag ? false : true
        if a.count == 0 || b.count == 0 {
            btnFlag = false
        }
        
        if let convertedA = Int(a) {
            if let convertedB = Int(b) {
                btnFlag = true
            }
        } else {
            btnFlag = false
        }
        
    }
}

#Preview {
    ex01()
}
