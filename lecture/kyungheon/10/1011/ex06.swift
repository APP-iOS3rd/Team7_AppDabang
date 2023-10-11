//
//  ex06.swift
//  DemoProject
//
//  Created by lkh on 10/11/23.
//

import SwiftUI

struct ex06: View {
    @State private var sec: String = ""
    @State private var btnFlag: Bool = false;
    
    var body: some View {
        if self.sec == nil || self.sec.isEmpty {
            print("~~~~~")
        }
        
        return VStack {
            Text("Ex-06")
            HStack {
                TextField("초 입력", text: $sec)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: buttonPressed, label: { Text("Send")})
                        .foregroundColor(.white)
                        .disabled( self.sec.isEmpty )
            }
            if (btnFlag) {
                let s = Int(sec)!
                
                Text("\(s/3600)시 \(s%3600/60)분 \(s%60)초")
            }
        }
        .modifier(StandardTitle())
    }
    
    func buttonPressed() {
        btnFlag = btnFlag ? false : true
     }
}

// 커스텀 수정자 (공통된 수정사항)
struct StandardTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .background(Color.teal)
            .border(Color.gray, width: 0.2)
            .shadow(color: Color.black, radius: 5, x: 0, y: 5)
    }
}


#Preview {
    ex06()
}
