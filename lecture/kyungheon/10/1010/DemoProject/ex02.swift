//
//  ex02.swift
//  DemoProject
//
//  Created by lkh on 10/10/23.
//

import SwiftUI

struct ex02: View {
    @State var a: String = ""
    @State var b: String = ""
    @State var btnFlag: Bool = false;
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                VStack {
                    TextField("귤?", text:$a)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("한 박스 개수?", text:$b)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
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
                Text("담은 박스 수: \(Int(a)!/Int(b)!)")
                Text("남은 귤 : \(Int(a)!%Int(b)!)")
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
    ex02()
}
