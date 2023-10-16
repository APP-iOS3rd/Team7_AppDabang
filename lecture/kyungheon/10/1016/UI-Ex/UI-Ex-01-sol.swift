//
//  UI-Ex-01-sol.swift
//  DemoProject
//
//  Created by lkh on 10/16/23.
//

import SwiftUI

struct UI_Ex_01_sol: View {

    @State private var text: String = ""

    var body: some View {
        VStack {
            Image("lion")
                .resizable()    // 이미지를 현재 View에 맞게 채워줌
                .aspectRatio(contentMode: .fit) // 이미지 비율 조정
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

                Button("CALL") {
                    let numberString = "01011112222"
                    let telephone = "tel://"
                    let formattedString = telephone + numberString
                    guard let url = URL(string: formattedString) else { return }
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
    UI_Ex_01_sol()
}
