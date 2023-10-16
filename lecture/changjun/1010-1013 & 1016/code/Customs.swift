//
//  Customs.swift
//  DemoProject2
//
//  Created by phang on 10/11/23.
//

import SwiftUI

struct Customs: View {
    var body: some View {
        Text("Customs!")
            .font(.largeTitle)
            .foregroundStyle(Color.pink)
    }
}

// MARK: - 하위뷰로 작업하기
struct MyStackView: View {
    var body: some View {
        HStack {
            Text("name")
            Text("age")
        }
    }
}

// MARK: - 커스텀 수정자
struct StandardTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .background(Color.white)
            .border(Color.gray, width: 0.2)
            .shadow(color: .black, radius: 3, x: 0, y: 3)
    }
}

// MARK: - 커스텀 컨테이너 뷰, ViewBuilder 속성을 사용
struct MyVStack<Content: View>: View {
    let content: () -> Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    var body: some View {
        VStack(spacing: 10) {
            content()
        }
        .font(.largeTitle)
    }
}

// swift 5.4 이상
// MARK: - 커스텀 컨테이너 뷰, ViewBuilder 속성을 사용
struct MyHStack<Content: View>: View{
    @ViewBuilder let content: Content
    var body: some View {
      HStack {
          content
      }
      .font(.largeTitle)
    }
}


// MARK: - 숫자만 강제로 ObservableObject
class NumberOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter{ $0.isNumber }
            if value != filtered {
                value = filtered
            }
        }
    }
}

// MARK: - Label 커스텀
struct LargeLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(Color.pink)
    }
}

// MARK: - textfield 커스텀
struct MyTextField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.roundedBorder)
            .keyboardType(.decimalPad)
            .foregroundColor(.black)
            .padding([.leading, .trailing], 60)
            .multilineTextAlignment(.center)
    }
}

// MARK: - VStack 커스텀 컨테이너
struct PhangVStack<Content: View>: View{
    @ViewBuilder let content: Content
    var body: some View {
        VStack (spacing: 50) {
          content
      }
        .padding(20)
    }
}

// MARK: - CustomPinkButton
struct CustomPinkButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.borderedProminent)
            .tint(Color.pink)
    }
}

#Preview {
    Customs()
}
