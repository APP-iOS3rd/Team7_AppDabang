//
//  ExerciseView14.swift
//  DemoProject2
//
//  Created by phang on 10/16/23.
//

import SwiftUI

struct ExerciseView14: View {
    var body: some View {
        VStack {
            Button { } label: { Text("Button").frame(maxWidth: .infinity) }
                .modifier(CustomPinkButton())
            
            Button { } label: { Text("Button").frame(maxWidth: .infinity, maxHeight: .infinity) }
                .foregroundColor(Color.white)
                .background(Color.pink)
                .clipShape(.rect(cornerSize: CGSize(width: 5, height: 5)))
            
            Button { } label: { Text("Button").frame(maxWidth: .infinity) }
                .modifier(CustomPinkButton())
        }
        .padding(10)
    }
}

#Preview {
    ExerciseView14()
}
