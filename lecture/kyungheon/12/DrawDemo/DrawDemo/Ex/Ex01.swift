//
//  Ex01.swift
//  DrawDemo
//
//  Created by lkh on 12/19/23.
//

import SwiftUI

struct Ex01: View {
    var body: some View {
        SpecialShape()
            .fill(Color.purple)
            .stroke(Color.black, lineWidth: 10)

    }
}

struct SpecialShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 30, y: 60))
        path.addLine(to: CGPoint(x: 50, y: 60))
        path.addQuadCurve(to: CGPoint(x: 200, y: 60), control: CGPoint(x: 120, y: 0)) // 볼록
        path.addLine(to: CGPoint(x: 230, y: 60))
        path.addLine(to: CGPoint(x: 230, y: 130))
        path.addLine(to: CGPoint(x: 30, y: 130))
        path.closeSubpath()
        return path
    }
}

#Preview {
    Ex01()
}
