//
//  LoadingWheel.swift
//  MentoringAPI
//
//  Created by phang on 11/16/23.
//

import SwiftUI

// 현재 기기 실행시, circle 애니메이션 틀어짐..
struct LoadingWheel: View {
    @State var isLoading: Bool = false
    private let lineWidth: CGFloat = 25
    private let pathColor: Color = .gray
    private let lineColor: Color = .pink
//    @State private var drawingStroke = false
//    private let animation = Animation
//        .easeOut(duration: 3)
//        .repeatForever(autoreverses: false)
//        .delay(0.5)
    
    var body: some View {
        VStack {
            Circle()
                .stroke(pathColor, lineWidth: lineWidth)
                .opacity(0.2)
                .overlay {
                    Circle()
                        .trim(from: 0, to: 0.2)
                        .stroke(style: StrokeStyle(lineWidth: lineWidth,
                                                   lineCap: .round,
                                                   lineJoin: .round))
                        .foregroundColor(lineColor)
                        .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                        .animation(Animation
                            .linear(duration: 2.2)
                            .repeatForever(autoreverses: false),
                                   value: isLoading)
                }
                .onAppear {
                    self.isLoading.toggle()
                }
        }
//        Group {
//            Circle()
//                .stroke(style: StrokeStyle(lineWidth: 25))
//                .foregroundStyle(.tertiary)
//                .overlay {
//                    Circle()
//                        .trim(from: 0, to: drawingStroke ? 1 : 0)
//                        .stroke(Color.pink.gradient,
//                                style: StrokeStyle(lineWidth: 25, lineCap: .round))
//                }
//                .rotationEffect(.degrees(-90))
//        }
//        .padding(100)
//        .animation(animation, value: drawingStroke)
//        .onAppear {
//            drawingStroke.toggle()
//        }
    }
}

#Preview {
    LoadingWheel()
}
