//
//  BasicView.swift
//  DemoProject2
//
//  Created by phang on 10/11/23.
//

import SwiftUI

struct BasicView: View {
    @ObservedObject private var number = NumberOnly()
    @State private var msg = ""
    @State private var score = 0

    // 프로퍼티로서의 뷰
    let carStack: some View = HStack {
        Text("Car Image")
            .font(.headline)
            .foregroundStyle(Color.orange)
        Image(systemName: "car.fill")
    }

    var body: some View {
        
        VStack {
            carStack // 프로퍼티로서의 뷰
            
            Image(systemName: "figure.sailing")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.blue)
            Text("Bonjoiur, Phang")
                .foregroundStyle(Color.white)
                .padding(10)
                .border(Color.pink)
            
            Text(msg)
                .modifier(StandardTitle()) // 커스텀 수정자 젹용
            
            HStack {
                TextField("score", value: $score, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                TextField("number", text: $number.value)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
            }
            
            HStack {
                TextField("Input", text: $msg)
                    .textFieldStyle(.roundedBorder)
                Button(action: btnPressed) {
                    Text("Send")
                        .foregroundStyle(Color.yellow)
                }
                .buttonStyle(.bordered)
            }
            
            MyStackView() // 하위뷰 적용
                .font(.custom("Copperplate", size: 40))
            
            MyVStack {  // 커스텀 컨테이너 뷰 적용
                Text("Hello")
                Text("Phang")
                    .font(.title)
            }
            
            // 레이블 뷰, 아이콘과 텍스트가 나란히 배치
            Label("Welcome", systemImage: "person.circle.fill")
                .font(.largeTitle)
            Label(
                title: { Text("Label") },
                icon: {
                    Circle()
                        .fill()
                        .frame(width: 25, height: 25)
                }
            )
        }
        .padding(100)
        .background(Color.gray)
    }

    private func btnPressed() {
        msg = "hahaha"
    }

}

#Preview {
    BasicView()
}
