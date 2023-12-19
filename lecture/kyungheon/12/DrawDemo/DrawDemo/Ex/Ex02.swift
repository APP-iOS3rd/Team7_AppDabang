//
//  Ex02.swift
//  DrawDemo
//
//  Created by lkh on 12/19/23.
//

import SwiftUI

struct Ex02: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PiShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 30, y: 60))
        path.addLine(to: CGPoint(x: 60, y: 60))
        path.addQuadCurve(to: CGPoint(x: 200, y: 60), control: CGPoint(x: 120, y: 0)) // 볼록
        path.addLine(to: CGPoint(x: 230, y: 60))
        path.addLine(to: CGPoint(x: 230, y: 130))
        path.addLine(to: CGPoint(x: 30, y: 130))
        path.closeSubpath()
        return path
    }
}

#Preview {
    Ex02()
}
