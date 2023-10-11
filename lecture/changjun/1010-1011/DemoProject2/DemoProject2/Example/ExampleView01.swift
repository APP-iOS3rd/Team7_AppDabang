//
//  ExampleView01.swift
//  DemoProject2
//
//  Created by phang on 10/11/23.
//

import SwiftUI

struct ExampleView01: View {
    @State private var msg = "Bonjour, Phang!"
    private let sendButtonText = "Send"
    
    var body: some View {
        VStack {
            Image(systemName: "pencil.and.scribble")
                .imageScale(.large)
                .foregroundStyle(.pink)
            Text(msg)
                .foregroundStyle(.white)
            HStack {
                TextField("Placeholder", text: $msg)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: buttonPressed, label: {
                    Text(sendButtonText)
                        .foregroundColor(.white)
                })
            }
        }
        .padding()
        .background(Color.gray)
        
        Text("hello")
    }
    
    private func buttonPressed() {
        msg = "Achèvement!"
    }
    
}

#Preview {
    ExampleView01()
}
