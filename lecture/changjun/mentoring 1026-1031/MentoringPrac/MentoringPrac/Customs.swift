//
//  Customs.swift
//  MentoringPrac
//
//  Created by phang on 10/29/23.
//

import SwiftUI

// MARK: - 커스텀 TextField

struct MentoringTextField: ViewModifier {
    
    var isFocused: Bool
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 24)
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .inset(by: 0.5)
                    .stroke(isFocused ? Color.black : Color.mtGray, lineWidth: 1)
            )
    }
}
