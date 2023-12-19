//
//  Ex03.swift
//  DrawDemo
//
//  Created by lkh on 12/19/23.
//

import SwiftUI

struct Ex03: View {
    var body: some View {
        TriangleShape()
            .stroke(Color.blue, lineWidth: 10)
    }
}

struct TriangleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 200, y: 100))
        path.addLine(to: CGPoint(x: 100, y: 300))
        path.addLine(to: CGPoint(x: 300, y: 300))
        path.closeSubpath()
        
        return path
    }
}


#Preview {
    Ex03()
}
