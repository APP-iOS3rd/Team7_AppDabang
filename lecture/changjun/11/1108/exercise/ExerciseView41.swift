//
//  ExerciseView41.swift
//  DemoProject2
//
//  Created by phang on 11/8/23.
//

import SwiftUI

// MARK: - data
struct MenuItem41: Identifiable, Hashable {
    let id = UUID()
    let name: String
    var price: Int?
    var subItems: [MenuItem41]?
}

let menuItems41 = [
    MenuItem41(name: "Korean", subItems: [
        MenuItem41(name: "Soup 🥘", subItems: [
            MenuItem41(name: "감자탕", price: 12000),
            MenuItem41(name: "순대국", price: 11000),
            MenuItem41(name: "설렁탕", price: 14000),
            MenuItem41(name: "순두부찌개", price: 11000),
            MenuItem41(name: "김치찌개", price: 9000),
            MenuItem41(name: "된장찌개", price: 9000)
        ]),
        MenuItem41(name: "Meet 🍖", subItems: [
            MenuItem41(name: "삼겹살", price: 16000),
            MenuItem41(name: "한우", price: 30000),
            MenuItem41(name: "제육", price: 9000),
            MenuItem41(name: "불고기", price: 10000)
        ]),
    ]),
    MenuItem41(name: "American", subItems: [
        MenuItem41(name: "Burger 🍔", subItems: [
            MenuItem41(name: "Cheese", price: 10000),
            MenuItem41(name: "Double", price: 14000),
            MenuItem41(name: "Shrimp", price: 11000),
            MenuItem41(name: "Chicken", price: 10000),
        ]),
        MenuItem41(name: "Pizza 🍕", subItems: [
            MenuItem41(name: "Cheese", price: 20000),
            MenuItem41(name: "Pepperoni", price: 21000),
            MenuItem41(name: "Hawaian", price: 23000),
            MenuItem41(name: "Veggie", price: 23000)
        ]),
        MenuItem41(name: "Salad 🥗", subItems: [
            MenuItem41(name: "Tuna", price: 11000),
            MenuItem41(name: "Salmon", price: 13000)
        ])
    ])
]

struct ExerciseView41: View {
    var body: some View {
        List {
            ForEach(menuItems41) { item in
                Section {
                    OutlineGroup(item.subItems ?? [MenuItem41](),
                                 children: \.subItems) { menu in
                        VStack(alignment: .leading) {
                            Text(menu.name)
                            if let price = menu.price {
                                Text("\(price) 원")
                                    .font(.caption2)
                            }
                        }
                    }
                } header: {
                    Text(item.name)
                        .fontWeight(.bold)
                }
            }
        }
    }
}

#Preview {
    ExerciseView41()
}
