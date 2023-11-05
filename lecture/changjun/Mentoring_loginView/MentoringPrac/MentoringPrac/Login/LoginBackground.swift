//
//  BackgroundView.swift
//  MentoringPrac
//
//  Created by phang on 10/29/23.
//

import SwiftUI

// MARK: - Login Background

struct LoginBackground: View {
    private let backgroungRectHeight = 0.85
    
    var body: some View {
        Rectangle()
            .fill(Color.mtBackground)
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height * backgroungRectHeight)
            .clipShape(
                .rect(
                    topLeadingRadius: 30,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 30
                )
            )
    }
}

#Preview {
    VStack {
        Spacer()
        LoginBackground()
    }
    .ignoresSafeArea()
}
