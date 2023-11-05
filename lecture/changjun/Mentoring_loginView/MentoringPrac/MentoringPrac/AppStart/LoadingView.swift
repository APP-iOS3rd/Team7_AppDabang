//
//  LoadingView.swift
//  MentoringPrac
//
//  Created by phang on 10/28/23.
//

import SwiftUI

// MARK: - App Logo & Name

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("☕️")
                .font(.system(size: 150))
            Text("App Dabang")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            Text("🦁 LikeLion AppSchool iOS 3rd")
                .foregroundStyle(Color.mtGray)
                .font(.footnote)
        }
    }
}

#Preview {
    LoadingView()
}
