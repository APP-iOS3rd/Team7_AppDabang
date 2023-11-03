//
//  ExerciseView27.swift
//  DemoProject2
//
//  Created by phang on 11/1/23.
//

import SwiftUI

struct ExerciseView27: View {
    
    @State private var listData = [
        "Item1", "Item2", "Item3", "Item4", "Item5",
        "Item6", "Item7", "Item8", "Item9", "Item10"
    ]
    
    var body: some View {
        VStack {
            Text("SwiftUI List Quiz")
                .font(.largeTitle)
                .padding()
            
            // list
            List(listData, id: \.self) { item in
                Text(item)
                    .foregroundStyle(Color.blue)
            }
        }
    }
}

#Preview {
    ExerciseView27()
}
