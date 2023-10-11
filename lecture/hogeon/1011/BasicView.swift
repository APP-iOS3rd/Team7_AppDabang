//
//  ContentView.swift
//  XcodeExample
//
//  Created by 박호건 on 10/11/23.
//

import SwiftUI

struct BasicView: View {
    @ObservedObject var num = NumberOnly()

    @State private var score: Int = 0
    @State private var msg = ""

    // 프로퍼티로서의 뷰
    let carStack = HStack {
        Text("Car Image")
            .font(.headline)
            .foregroundColor(.red)
        Image(systemName: "car.fill")
    }

    var body: some View {

        VStack {
            carStack  // 프로퍼티로서의 뷰
            Image(systemName: "pencil.and.scribble")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .foregroundColor(Color.white)
                .padding()   // 수정자 순서 주의!
                .border(Color.white)

            // 커스텀 수정자 적용 234
            Text("\(msg)")
                .modifier(StandardTitle())

            // 숫자 입력
            HStack {
                TextField("Score", value: $score, format: .number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                TextField("Number", text: $num.value)
                    .textContentType(.creditCardNumber)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }

            HStack {
                TextField("Input", text: $msg)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: btnPressed, label: {
                    Image(systemName: "square.and.arrow.up")
                })
            }
            // 하위뷰
            MyStackView()
                .font(.custom("Copperplate", size: 40))

            // 커스텀 컨테이너 뷰
            MyVStack {
                Text("Hello")
                Text("World")
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
        .background(Color.teal)
    }

    func btnPressed() {
        msg = "hahaha"
    }
}

// 하위뷰로 작업하기
struct MyStackView: View {
    var body: some View {
        HStack {
            Text("name")
            Text("age")
        }
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

// 커스텀 컨테이너 뷰, ViewBuilder 속성을 사용
struct MyVStack<Content: View>: View {
    let content: () -> Content
    init(@ViewBuilder content: @escaping () -> Content ) {
        self.content = content
    }

    var body: some View {
        VStack(spacing: 10) {
            content()
        }
        .font(.largeTitle)
    }
}

// 숫자만 강제하는 ObservableObject
class NumberOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let fillered = value.filter { $0.isNumber }

            if value != fillered {
                value = fillered
            }
        }
    }
}

#Preview{
    BasicView()
}
