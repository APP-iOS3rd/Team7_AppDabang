//
//  ExerciseView30.swift
//  DemoProject2
//
//  Created by phang on 11/1/23.
//

import SwiftUI

struct Item30: Identifiable {
    var id = UUID()
    var name: String
    var isOnToggle: Bool
}

struct ExerciseView30: View {
    
    @State private var listData: [Item30] = [
        Item30(name: "Item1", isOnToggle: false), Item30(name: "Item2", isOnToggle: false),
        Item30(name: "Item3", isOnToggle: false), Item30(name: "Item4", isOnToggle: false),
        Item30(name: "Item5", isOnToggle: false), Item30(name: "Item6", isOnToggle: false),
        Item30(name: "Item7", isOnToggle: false), Item30(name: "Item8", isOnToggle: false),
        Item30(name: "Item9", isOnToggle: false), Item30(name: "Item10", isOnToggle: false)
    ]
    var body: some View {
        Text("SwiftUI List Quiz")
            .font(.largeTitle)
            .padding()
        List($listData) { $item in
            HStack {
                Text("\(item.name)")
                    .fontWeight(item.isOnToggle ? .bold : .regular)
                Spacer()
                Toggle(isOn: $item.isOnToggle, label: {})
            }
        }
    }
}

#Preview {
    ExerciseView30()
}
