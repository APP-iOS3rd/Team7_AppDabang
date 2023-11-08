//
//  ExerciseView42.swift
//  DemoProject2
//
//  Created by phang on 11/8/23.
//

import SwiftUI

struct ExerciseView42: View {
    private var gridItems = [
        GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()),
        GridItem(.flexible()), GridItem(.flexible())
    ]
    private var indexData: [Int] {
        (1...gridItems.count * gridItems.count).map {$0}
    }
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 10) {
            ForEach(indexData, id: \.self) { index in
                VStack(alignment: .center) {
                    Rectangle()
                        .fill(Color.pink)
                        .frame(height: 20)
                        .clipShape(.rect(cornerRadius: 10))
                    Text("\(index)")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ExerciseView42()
}
