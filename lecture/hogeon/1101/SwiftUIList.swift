/*
List 를 사용하여 다음과 같은 화면을 구현해보세요.

화면에는 "SwiftUI List Quiz" 라는 제목이 있습니다.
List 에는 10개의 행이 있으며, 각 행에는 "Item 1", "Item 2", ... , "Item 10" 이라는 텍스트가 있습니다.
List 의 배경색은 흰색이고, 텍스트의 색은 파란색입니다.
// 예시코드:
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("SwiftUI List Quiz")
            .font(.largeTitle)
            .padding()
        // 여기에 코드를 작성하세요.
    }
}

#Preview {
    ContentView()
}
*/
struct ContentView: View {

    var body: some View {
        Text("SwiftUI List Quiz")
            .font(.largeTitle)
            .padding()
        List(1...10, id: \.self) { item in
            Text("Item \(item)")
                .foregroundColor(.blue)
        }
        .background(.white)
    }
}

/*
List 를 사용하여 다음과 같은 화면을 구현해보세요.

화면에는 "SwiftUI List Quiz" 라는 제목이 있습니다.
List 에는 5개의 섹션이 있으며, 각 섹션에는 "Section 1", "Section 2", ... , "Section 5" 라는 헤더가 있습니다.
각 섹션에는 3개의 행이 있으며, 각 행에는 "Row 1", "Row 2", "Row 3" 이라는 텍스트가 있습니다.
List 의 배경색은 회색이고, 헤더의 텍스트 색은 검은색, 행의 텍스트색은 파란색입니다.
// 예시코드:
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("SwiftUI List Quiz")
            .font(.largeTitle)
            .padding()
        // 여기에 코드를 작성하세요.
    }
}

#Preview {
    ContentView()
}
*/
struct ContentView: View {

    var body: some View {
        Text("SwiftUI List Quiz")
            .font(.largeTitle)
            .padding()
        List() {
            ForEach(1..<6) { section in
                Section(header: Text("Section \(section)")) {
                    ForEach(1..<4) { row in
                        Text("Item \(row)")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }

                }
            }
        }
        .background(.gray)
    }
}

/*
List 를 사용하여 다음과 같은 화면을 구현해보세요.

화면에는 "SwiftUI List Quiz" 라는 제목이 있습니다.
List 에는 10개의 행이 있으며, 각 행에는 "Item 1", "Item 2", ... , "Item 10" 이라는 텍스트와 오른쪽에 체크마크 아이콘이 있습니다.
체크마크 아이콘은 기본적으로 숨겨져 있으며, 행을 선택(터치, 클릭)하면 보이게 됩니다.
다른 행을 탭하면 이전에 선택된 행의 체크마크 아이콘이 사라지고, 새로 선택된 행의 체크마크 아이콘이 보이게 됩니다.
// 예시코드:
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("SwiftUI List Quiz")
            .font(.largeTitle)
            .padding()
        // 여기에 코드를 작성하세요.
    }
}

#Preview {
    ContentView()
}
*/
import SwiftUI

struct ContentView: View {

    @State private var selectedItem = 0

    var body: some View {
        Text("SwiftUI List Quiz")
            .font(.largeTitle)
            .padding()

        List(1...10, id: \.self) { item in
            HStack {
                Text("Item \(item)")
                Spacer()
                if selectedItem == item {
                    Image(systemName: "checkmark")
                }
            }
            .onTapGesture {
                selectedItem = item
            }
        }
    }
}

/*
List 를 사용하여 다음과 같은 화면을 구현해보세요.

화면에는 "SwiftUI List Quiz" 라는 제목이 있습니다.
List 에는 10개의 행이 있으며, 각 행에는 "Item 1", "Item 2", ... , "Item 10" 이라는 텍스트와 오른쪽에 스위치가 있습니다.
스위치는 기본적으로 꺼져 있으며, 스위치를 드래그하면 켜지거나 꺼지게 됩니다.
스위치가 켜진 행의 텍스트는 굵게 표시되고, 스위치가 꺼진 행의 텍스트는 일반적으로 표시됩니다.
// 예시코드:
import SwiftUI

struct ContentView: View {
    // 여기에 코드를 작성하세요.

    var body: some View {
        Text("SwiftUI List Quiz")
            .font(.largeTitle)
            .padding()
        List(1...10, id: \.self) { item in
            HStack {
                Text("Item \(item)")
                // 여기에 코드를 작성하세요.
                Spacer()
                // 여기에 코드를 작성하세요.
            }
        }
    }
}

#Preview {
    ContentView()
}
*/
struct ContentView: View {

    @State private var switchStates = Array(repeating: false, count: 10)

    var body: some View {
        Text("SwiftUI List Quiz")
            .font(.largeTitle)
            .padding()
        List(1...10, id: \.self) { item in
            HStack {
                Text("Item \(item)")
                    .fontWeight(switchStates[item - 1] ? .bold : .regular)
                Spacer()
                Toggle("", isOn: $switchStates[item - 1])
            }
        }
    }
}

/*
List 를 사용하여 다음과 같은 화면을 구현해보세요.

화면에는 "SwiftUI List Quiz" 라는 제목이 있습니다.
List 에는 10개의 행이 있으며, 각 행에는 "Item 1", "Item 2", ... , "Item 10" 이라는 텍스트와 오른쪽에 삭제 버튼이 있습니다.
삭제 버튼을 탭하면 해당 행이 삭제되고, 나머지 행들이 재정렬됩니다.
import SwiftUI

struct ContentView: View {

    @State var items = Array(1...10)

    var body: some View {
        Text("SwiftUI List Quiz")
            .font(.largeTitle)
            .padding()
        List {
            ForEach(items, id: \.self ) { item in
                HStack {
                    Text("Item \(item)")
                    Spacer()
                    Button(action: {
                        if let index = items.firstIndex(of: item) {
                            items.remove(at: index)
                        }
                    }, label: {
                        Image(systemName: "trash")
                    })
                }
            }
        }

    }
}

#Preview {
    ContentView()
}
*/
struct ContentView: View {

    struct Item: Identifiable {
        let id = UUID()
        let image: String
        let text: String
    }

    @State var items = [
        Item(image: "appplelogo", text: "Apple"),
        Item(image: "swift", text: "Swift"),
        Item(image: "xcode", text: "Xcode"),
        Item(image: "macos", text: "macOS"),
        Item(image: "ios", text: "iOS")
    ]

    var body: some View {
        Text("")
            .font(.largeTitle)
            .padding()
        NavigationStack {

            List {
                ForEach( items ) { item in
                    HStack {
                        Text("Item \(item.text)")
                    }
                }
                .onDelete(perform: { indexSet in
                    items.remove(atOffsets: indexSet)
                })
                .onMove(perform: { indices, newOffset in
                    print("\(indices)")
                    items.move(fromOffsets: indices, toOffset: newOffset)
                })
            }
            .navigationTitle("SwiftUI List Quiz")
            .toolbar { EditButton() }

        }

    }
}