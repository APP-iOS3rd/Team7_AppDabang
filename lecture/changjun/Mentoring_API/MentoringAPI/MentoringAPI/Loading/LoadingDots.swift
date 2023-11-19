//
//  LoadingDots.swift
//  MentoringAPI
//
//  Created by phang on 11/16/23.
//

import SwiftUI

struct LoadingDots: View {
    @State private var leftOffset: CGFloat = -100
    @State private var rightOffset: CGFloat = 100
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.pink)
                .frame(width: 30, height: 30)
                .offset(x: leftOffset)
                .opacity(0.7)
                .animation(Animation.easeInOut(duration: 1), value: leftOffset)
            Circle()
                .fill(Color.pink)
                .frame(width: 30, height: 30)
                .offset(x: leftOffset)
                .opacity(0.7)
                .animation(Animation.easeInOut(duration: 1).delay(0.2), value: leftOffset)
            Circle()
                .fill(Color.pink)
                .frame(width: 30, height: 30)
                .offset(x: leftOffset)
                .opacity(0.7)
                .animation(Animation.easeInOut(duration: 1).delay(0.4), value: leftOffset)
        }
        .onReceive(timer) { _ in
            swap(&leftOffset, &rightOffset)
        }
    }
}

#Preview {
    LoadingDots()
}
