//
//  Ex05.swift
//  DrawDemo
//
//  Created by lkh on 12/19/23.
//

import SwiftUI

struct Ex05: View {
    @State private var rotation: Double = 0.0
    
    var body: some View {
        ZStack {
            BadgeSymbol()
                .rotationEffect(.degrees(rotation))
                .animation(Animation.linear(duration: 2.0).repeatForever(autoreverses: false))
        }
        .frame(width: 300, height: 100)
                        .padding()
        .onAppear {
            withAnimation {
                rotation = -360.0
            }
        }
    }
}

struct BadgeSymbol: View {
    static let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.75
                let spacing = width * 0.030
                let middle = width * 0.5
                let topWidth = width * 0.3
                let topHeight = height * 0.5

                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: middle + topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: spacing)
                ])

                path.move(to: CGPoint(x: middle, y: topHeight + spacing))
                path.addLines([
                    CGPoint(x: middle - topWidth, y: topHeight + spacing),
                    CGPoint(x: spacing, y: height - spacing),
                    CGPoint(x: width - spacing, y: height - spacing),
                    CGPoint(x: middle + topWidth, y: topHeight + spacing),
                    CGPoint(x: middle, y: topHeight + spacing)
                ])
            }
            .fill(Self.symbolColor)
        }
    }
}

#Preview {
    Ex05()
}
