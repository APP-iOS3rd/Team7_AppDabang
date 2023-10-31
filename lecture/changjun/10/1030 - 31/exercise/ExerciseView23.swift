//
//  ExerciseView23.swift
//  DemoProject2
//
//  Created by phang on 10/30/23.
//

import SwiftUI

struct ExerciseView23: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 100)

            Rectangle()
                .fill(Color.blue)
                .frame(width: 50, height: 50)

        }
    }
}

#Preview {
    ExerciseView23()
}
