//
//  UI-Ex-01.swift
//  DemoProject
//
//  Created by lkh on 10/16/23.
//

import SwiftUI

struct UI_Ex_01: View {
    @State private var textStr: String = "HELLO, WORLD!"
    @State private var btnStr: String = "Hello, World!"
    
    var body: some View {
        VStack {
            Image("clownImg")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: .infinity, height: .infinity)
                .cornerRadius(10)
            
            HStack {
                Button("HOME") {
                    self.textStr = "HOME"
                }
                .modifier(btnCustom())
                
                
                Spacer()
                Text(textStr)
                Spacer()
                
                Button("CALL") {
                    self.textStr = "CALL"
                }
                .modifier(btnCustom())
                
            }
            
            Spacer()
            
            HStack {
                TextField("", text: $btnStr)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: btnPressed, label: {Text("Hello Button")})
                    .modifier(btnCustom())
            }.padding()
        }
        .padding()
        .background(Color.teal)
    }
    
    func btnPressed() {
        self.textStr = self.btnStr.uppercased()
    }
}

struct btnCustom: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(8)
            .background(.indigo)
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}

#Preview {
    UI_Ex_01()
}
