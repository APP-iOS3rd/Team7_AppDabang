//
//  ExerciseView40.swift
//  DemoProject2
//
//  Created by phang on 11/8/23.
//

import SwiftUI

// MARK: - data
struct MenuItem40: Hashable {
    let name: String
    var subItems: [MenuItem40]?
}

let menuItems40 = [
    MenuItem40(name: "Burger"),
    MenuItem40(name: "Pizza", subItems: [
        MenuItem40(name: "Cheese"),
        MenuItem40(name: "Pepperoni"),
        MenuItem40(name: "Veggie")
    ]),
    MenuItem40(name: "Salad")
]

struct ExerciseView40: View {
    var body: some View {
        List(menuItems40, id: \.self, children: \.subItems) { item in
            HStack {
                Text(item.name)
            }
        }
    }
}

#Preview {
    ExerciseView40()
}
