//
//  PathView.swift
//  DrawDemo
//
//  Created by lkh on 12/19/23.
//

import SwiftUI

struct PathView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 10, y: 10))
            path.addLine(to: CGPoint(x: 10, y: 350))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.closeSubpath()
        }
        .fill(.green)
    }
}

#Preview {
    PathView()
}
