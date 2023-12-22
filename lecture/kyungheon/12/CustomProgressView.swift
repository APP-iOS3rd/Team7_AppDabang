//
//  CustomProgressView.swift
//  ApiDemo
//
//  Created by lkh on 12/22/23.
//

import SwiftUI

// ProgressView 사용자 정의
struct CustomProgressView: View {

    @State private var progress: Double = 1.0

    var body: some View {
        VStack {
            ProgressView("Task 1 Process", value: progress, total: 100)
                .progressViewStyle(ShadowProgressViewStyle())

            ProgressView("Task 2 Process", value: progress, total: 100)
                .progressViewStyle(MyCustomProgressViewStyle())

            ProgressView("Task 3 Process", value: progress, total: 100)
                .progressViewStyle(MyCircleCustomProgressViewStyle())

            Slider(value: $progress, in: 1...100, step: 0.1)
        }
        .padding()
    }
}

// 강조 색상과 그림자 효과를 적용한 프로그래스 뷰
struct ShadowProgressViewStyle : ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            // 강조 색상
            .accentColor(.red)
            // 그림자 효과
            .shadow(color: Color(red: 0, green: 0.7, blue: 0), radius: 5.0, x: 2.0, y: 2.0)
            .progressViewStyle(LinearProgressViewStyle())
    }
}

// Text 뷰에 진행률을 표시하는 프로그래스 뷰
struct MyCustomProgressViewStyle : ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {

        let percent = Int(configuration.fractionCompleted! * 100)

        return Text("Task \(percent)% Complete")
    }
}

// 원형 모양의 사용자 정의 프로그래스 뷰 스타일
struct MyCircleCustomProgressViewStyle : ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {

        let degres = configuration.fractionCompleted! * 360

        return MyCircle(startAngle: .degrees(1), endAngle: .degrees(degres))
            .frame(width: 200, height: 200)
            .padding(50)
    }
}


// 원형 경로를 그리는 Shape
struct MyCircle: Shape {
    var startAngle: Angle
    var endAngle: Angle

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                    radius: rect.width / 2, startAngle: startAngle,
                    endAngle: endAngle, clockwise: true)

        return path.strokedPath(.init(lineWidth: 100, dash: [5, 3],
                                      dashPhase: 10))
    }
}

#Preview {
    CustomProgressView()
}
