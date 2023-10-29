//
//  BackgroundView.swift
//  MentoringPrac
//
//  Created by phang on 10/29/23.
//

import SwiftUI

// MARK: - Login Background

struct BackgroundView: View {
    
    let geo: GeometryProxy
    let backgroungRectHeight = 0.95
    
    var body: some View {
        Rectangle()
            .fill(Color.mtBackground)
            .frame(width: geo.size.width,
                   height: geo.size.height * backgroungRectHeight)
            .clipShape(.rect(cornerRadius: 30))
    }
}

#Preview {
    GeometryReader { geo in
        VStack {
            Spacer()
            BackgroundView(geo: geo)
        }
        .ignoresSafeArea()
    }
}
