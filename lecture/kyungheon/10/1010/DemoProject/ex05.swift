//
//  ex05.swift
//  DemoProject
//
//  Created by lkh on 10/10/23.
//

import SwiftUI

struct ex05: View {
    @State var strSwift: String = ""
    @State var striOS: String = ""
    @State var strWeb: String = ""
    @State var btnFlag: Bool = false;
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                VStack {
                    TextField("Swift :", text:$strSwift)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    //                .keyboardType(.numberPad)

                    TextField("iOS :", text:$striOS)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Web :", text:$strWeb)
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
                Text("합계: \(Int(strSwift)!+Int(striOS)!+Int(strWeb)!)")
                Text("평균 : \((Int(strSwift)!+Int(striOS)!+Int(strWeb)!)/3)")
            }
        }
    }
    
    
    func btnCheck() {
        //btnFlag = btnFlag ? false : true
        if strSwift.count == 0 || striOS.count == 0 || strWeb.count == 0 {
            btnFlag = false
        }
        
        if let convertedA = Int(strSwift) {
            if let convertedB = Int(striOS) {
                if let  convertedC = Int(strWeb) {
                    btnFlag = true
                }
            }
        } else {
            btnFlag = false
        }
        
    }
}

#Preview {
    ex05()
}
