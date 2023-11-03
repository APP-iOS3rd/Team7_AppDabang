//
//  ExerciseView25.swift
//  DemoProject2
//
//  Created by phang on 10/30/23.
//

import SwiftUI

struct ExerciseView25: View {
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            Text("Hello")
                .font(.largeTitle)
            
            Spacer()

            Text("World")
        }
        .padding()
    }
}

#Preview {
    ExerciseView25()
}
