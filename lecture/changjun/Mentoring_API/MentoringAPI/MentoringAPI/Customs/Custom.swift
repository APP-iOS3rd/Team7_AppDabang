//
//  Custom.swift
//  MentoringAPI
//
//  Created by phang on 11/20/23.
//

import SwiftUI

struct MainTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.bold)
    }
}

struct SubTitle2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .fontWeight(.semibold)
    }
}
    
struct SubTitle3: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .fontWeight(.semibold)
    }
}
