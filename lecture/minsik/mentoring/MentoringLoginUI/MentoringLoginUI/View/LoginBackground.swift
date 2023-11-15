//
//  LoginBackground.swift
//  MentoringLoginUI
//
//  Created by 조민식 on 2023/11/01.
//

import SwiftUI

struct LoginBackground: View {
    
    let geo: GeometryProxy
    let backgroungRectHeight = 0.9
    
    var body: some View {
        Rectangle()
            .fill(ColorGroup.background)
            .frame(width: geo.size.width,
                   height: geo.size.height * backgroungRectHeight)
            .clipShape(.rect(cornerRadius: 30))
    }
}

#Preview {
    GeometryReader { geo in
        VStack {
            Spacer()
            LoginBackground(geo: geo)
        }
        .ignoresSafeArea()
    }
}
