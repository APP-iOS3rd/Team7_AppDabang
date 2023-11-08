//
//  OutlineGroupEx02.swift
//  OutlineDemo
//
//  Created by lkh on 11/8/23.
//

import SwiftUI

/*
 다음 코드는 OutlineGroup을 이용하여 메뉴 아이템을 표시하려고 합니다.

 예시 코드의 MenuItem을 이용하여

 다음 화면이 되도록 구현해 보세요.
 */

struct MenuItem: Identifiable {
    let id = UUID()
    let name: String
    let price: Double?
    let children: [MenuItem]?
    
    init(name: String) {
        self.name = name
        self.price = nil
        self.children = nil
    }
    
    init(name: String, price: Double?, children: [MenuItem]?) {
        self.name = name
        self.price = price
        self.children = children
    }
}

struct OutlineGroupEx02: View {
    let items: [MenuItem] =
        [
            MenuItem(name: "Burger"),
            MenuItem(name: "Pizza", price: nil, children: [
                MenuItem(name: "Cheese"),
                MenuItem(name: "Pepperoni"),
                MenuItem(name: "Veggie")
            ]),
            MenuItem(name: "Salad")
        ]
    
    var body: some View {
        List {
            OutlineGroup(items, children: \.children) { item in
                HStack {
                    Text(item.name)
                    
                    Spacer()
                    
                    if let itemPrice = item.price {
                        Text("\(itemPrice)")
                    }
                }
            }
        }
    }
}

#Preview {
    OutlineGroupEx02()
}
