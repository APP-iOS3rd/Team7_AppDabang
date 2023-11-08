/*
OutlineGroup을 이용하여 계층적인 데이터를 표시하려고 합니다.

*/
struct Node: Identifiable {
    var id = UUID()
    var value: String
    var children: [Node]?
}

struct ContentView: View {
    var data = [
        Node(value: "A", children: [
            Node(value: "B"),
            Node(value: "C", children: [
                Node(value: "D"),
                Node(value: "E")
            ])
        ]),
        Node(value: "F")
    ]

    var body: some View {
        List {
            OutlineGroup(data, id: \.id, children: \.children) { node in
                Text(node.value)
            }
        }
    }
}

/*
다음 코드는 OutlineGroup을 이용하여 메뉴 아이템을 표시하려고 합니다.

예시 코드의 MenuItem을 이용하여

다음 화면이 되도록 구현해 보세요.
// 예시 코드:
struct MenuItem {
    let name: String
    let price: Double?
    let subItems: [MenuItem]?
}
*/
struct MenuItem {
    let name: String
    let price: Double?
    let subItems: [MenuItem]?
}

struct TestUIView: View {
    var menu = [
        MenuItem(name: "Burger", price: 10.0, subItems: nil),
        MenuItem(name: "Pizza", price: nil, subItems: [
            MenuItem(name: "Cheese", price: 8.0, subItems: nil),
            MenuItem(name: "Pepperoni", price: 8.0, subItems: nil),
            MenuItem(name: "Veggie", price: 8.0, subItems: nil)
        ]),
        MenuItem(name: "Salid", price: 3.0, subItems: nil)
    ]

    var body: some View {
        List {
            OutlineGroup(menu, id: \.name, children: \.subItems) { item in
                Text(item.name)
            }
        }
    }
}