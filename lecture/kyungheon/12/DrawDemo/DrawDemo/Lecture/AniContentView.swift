//
//  AniContentView.swift
//  DrawDemo
//
//  Created by lkh on 12/19/23.
//

import SwiftUI

struct AniContentView: View {

    @State private var rotation: Double = 0

    var body: some View {
        Button {
            self.rotation = (self.rotation < 360 ? self.rotation + 60 : 0)
        } label: {
            Text("Click to animate")
                .rotationEffect(.degrees(rotation))
                .animation(.linear(duration: 1), value: rotation)
        }

    }
}

#Preview {
    AniContentView()
}
