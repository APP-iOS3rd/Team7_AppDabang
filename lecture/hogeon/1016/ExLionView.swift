//
//  ExLionView.swift
//  XcodeExample
//
//  Created by 박호건 on 10/16/23.
//

import SwiftUI

struct ExLionView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            Image("lion")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: .infinity, height: .infinity)
                .cornerRadius(10)
            HStack {
                Link(destination: /*@START_MENU_TOKEN@*/URL(string: "https://www.apple.com")!/*@END_MENU_TOKEN@*/, label: {
                    Text("Home")
                    Image(systemName: "house.circle")
                })
                .padding(5)
                .foregroundColor(Color.white)
                .background(Color.indigo)
                .cornerRadius(5)
                                
                Spacer()
                Text("Hello")
                Spacer()
                
                Button("Call") {
                    let numberString = "01011112222"
                    let telephone = "tel://"
                    let formattedString = telephone + numberString
                    guard let url =  URL(string: formattedString) else {return}
                    UIApplication.shared.open(url)
                }
                .padding(5)
                .foregroundColor(Color.white)
                .background(Color.indigo)
                .cornerRadius(5)
            }
            Spacer()
            HStack {
                TextField(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/, text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("HELLO BUTTON") {

                }
                .padding(5)
                .foregroundColor(Color.white)
                .background(Color.indigo)
                .cornerRadius(5)
            }
        }
        .padding()
        .background(Color.teal)
        
    }
}

#Preview {
    ExLionView()
}
