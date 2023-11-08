//
//  ExerciseView39.swift
//  DemoProject2
//
//  Created by phang on 11/8/23.
//

import SwiftUI

// MARK: - data
struct Item39: Identifiable {
    let id = UUID()
    var item: String
    var childern: [Item39]?
}

let items39 = [
    Item39(item: "A", childern: [
        Item39(item: "B"),
        Item39(item: "C", childern: [
            Item39(item: "D"),
            Item39(item: "E")
        ])
    ]),
    Item39(item: "F")
]

// MARK: - View
struct ExerciseView39: View {
    var body: some View {
        List {
            OutlineGroup(items39, children: \.childern) { child in
                Text(child.item)
            }
        }
    }
}

#Preview {
    ExerciseView39()
}
