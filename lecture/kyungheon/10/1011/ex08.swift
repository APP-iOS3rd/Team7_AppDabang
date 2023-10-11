//
//  ex08.swift
//  DemoProject
//
//  Created by lkh on 10/11/23.
//

import SwiftUI

struct ex08: View {
    @State private var t: String = ""
    @State private var sec: String = ""
    @State private var btnFlag: Bool = false;

    
    var body: some View {
        inputCheck()
        
        return VStack {
            Text("Ex-08")
            HStack {
                inputView(t: $t, sec: $sec)
                
                Spacer()
                
                Button(action: buttonPressed, label: { Text("Send")})
                        .foregroundColor(.white)
                        .disabled( self.t.isEmpty )
            }
            
            if (btnFlag) {
                ResultView(s: Int(sec)!, s2: Int(t)!)
            }
        }
        .modifier(StandardTitle())
        
        // MARK: - buttonPressed
        func buttonPressed() {
            btnFlag = btnFlag ? false : true
             
         }
        
        // MARK: - inputCheck
        func inputCheck() {
            if self.sec == nil || self.sec.isEmpty || self.t == nil || self.t.isEmpty {
                print("~~~~~")
            }
        }
        
    }
    
    struct NaviView: View {
        var body: some View {
            NavigationView {
                VStack {
                    NavigationLink(destination: ex06(), label: {
                            Text("6번 풀기")
                            .font(.largeTitle)}
                    )
                    
                    NavigationLink(destination: ex07(), label: {
                            Text("7번 풀기")
                            .font(.largeTitle)}
                    )
                }
            }
        }
    }
    
    // MARK: - frontView
    struct inputView: View {
        @Binding var t: String
        @Binding var sec: String
        
        var body: some View {
            VStack {
                TextField("초 입력", text: $sec)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("근무 시간 입력", text: $t)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }
    }

    
    // MARK: - ResultView
    struct ResultView: View {
        var s: Int
        let s2: Int
        var body: some View {
            VStack {
                Text("\(s2/3600)시 \(s2%3600/60)분 \(s2%60)초")
                    
                Text("총 급여는 \(s < 8 ? s*10000 : s*Int(10000*1.5))")
            }
            .padding()
        }
    }
}

#Preview {
    ex08()
}
