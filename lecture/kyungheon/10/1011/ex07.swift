//
//  ex07.swift
//  DemoProject
//
//  Created by lkh on 10/11/23.
//

import SwiftUI

struct ex07: View {
    @State private var t: String = ""
    @State private var res: String = ""
    @State private var btnFlag: Bool = false;
    
    var body: some View {
        if self.t.isEmpty {
            print("비어있음")
        }
        
        return VStack {
            Text("Ex-07")
            HStack {
                TextField("근무 시간 입력", text: $t)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: buttonPressed, label: { Text("Send")})
                        .foregroundColor(.white)
                        .disabled( self.t.isEmpty )
            }
            
            if (btnFlag) {
                Text("총 급여는 "+res+"원 입니다.")
            }
        }
        .modifier(StandardTitle())
    }
    
    func buttonPressed() {
        if let convertedT = Int(t) {
            btnFlag = true

            res = String((convertedT*10000) + (convertedT-8) * Int(10000*1.5))
        } else {
            btnFlag = false
        }
     }
}

#Preview {
    ex07()
}
