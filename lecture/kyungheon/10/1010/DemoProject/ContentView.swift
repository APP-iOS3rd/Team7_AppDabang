//
//  ContentView.swift
//  DemoProject
//
//  Created by lkh on 10/10/23.
//

import SwiftUI

struct ContentView: View {

    @State private var msg: String = "Hello, world!"
    @State private var msg2: String = "Hello, world!"

    var body: some View {
        VStack {
            Image(systemName: "pencil.and.scribble")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("\(msg)")
                .foregroundColor(.white)


            HStack {
                TextField("Placeholder", text: $msg2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: buttonPressed, label: { Text("Send")})
                    .foregroundColor(.white)
            }
        }
        .padding(10)
        .background(Color.indigo)
    }

    func buttonPressed() {
        msg = String(1 + 1)
    }
}

#Preview {
    ContentView()
}
