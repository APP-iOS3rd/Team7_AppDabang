//
//  LaunchedView.swift
//  MovieDabang
//
//  Created by phang on 11/2/23.
//

import SwiftUI

// MARK: - 런치드 화면

struct LaunchedView: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("🎥")
                .font(.system(size: 150))
            Text("Dabang Movie")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            Group {
                VStack(alignment: .center) {
                    Text("🦁 LikeLion AppSchool iOS 3rd")
                    Text("☕️ App Dabang")
                }
            }
            .foregroundStyle(Color.gray)
            .font(.footnote)
        }
    }
}

#Preview {
    LaunchedView()
}
