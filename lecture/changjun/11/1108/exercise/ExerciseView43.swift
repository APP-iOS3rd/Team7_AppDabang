//
//  ExerciseView43.swift
//  DemoProject2
//
//  Created by phang on 11/8/23.
//

import SwiftUI

struct ExerciseView43: View {
    @State private var columnCount: Double = 1.0
    @State private var gridItems = [GridItem(.flexible())]
    private let columnRange: ClosedRange<Double> = 1...5

    
    var body: some View {
        VStack {
            Slider(value: $columnCount, in: columnRange, step: 1.0)
            Spacer()
            LazyVGrid(columns: gridItems, spacing: 10) {
                ForEach((0..<5), id: \.self) { _ in
                    Text("1")
                        .frame(minWidth: 60, minHeight: 50, maxHeight: .infinity)
                        .background(Color.pink)
                        .clipShape(.rect(cornerRadius: 8))
                        .font(.largeTitle)
                }
            }
            Spacer()
        }
        .padding()
        .onChange(of: columnCount) { newValue in
            gridItems = Array(repeating: GridItem(.flexible()), count: Int(newValue))
        }
    }
}

#Preview {
    ExerciseView43()
}
