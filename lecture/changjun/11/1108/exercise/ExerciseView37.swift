//
//  ExerciseView37.swift
//  DemoProject2
//
//  Created by phang on 11/8/23.
//

import SwiftUI

struct Item37: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var content: String
}

struct ListView: View {
    var items: [Item37]
    @Binding var selectedItem: Item37?

    var body: some View {
        // 여기에 코드를 작성하세요.
        List(items, selection: $selectedItem) { item in
            Text(item.title).tag(item)
        }
    }
}

struct DetailView: View {
    var item: Item37?

    var body: some View {
        VStack {
            Text(item?.title ?? "선택한 항목 없음")
                .font(.largeTitle)
            Text(item?.content ?? "항목을 선택해주세요.")
                .padding()
        }
    }
}

struct ExerciseView37: View {
    // 샘플 데이터
    let items = [
        Item37(title: "첫 번째 항목", content: "이것은 첫 번째 항목입니다."),
        Item37(title: "두 번째 항목", content: "이것은 두 번째 항목입니다."),
        Item37(title: "세 번째 항목", content: "이것은 세 번째 항목입니다."),
        Item37(title: "네 번째 항목", content: "이것은 네 번째 항목입니다."),
        Item37(title: "다섯 번째 항목", content: "이것은 다섯 번째 항목입니다."),
        Item37(title: "여섯 번째 항목", content: "이것은 여섯 번째 항목입니다."),
        Item37(title: "일곱 번째 항목", content: "이것은 일곱 번째 항목입니다."),
        Item37(title: "여덟 번째 항목", content: "이것은 여덟 번째 항목입니다."),
        Item37(title: "아홉 번째 항목", content: "이것은 아홉 번째 항목입니다."),
        Item37(title: "열 번째 항목", content: "이것은 열 번째 항목입니다.")
    ]
    @State var selectedItem: Item37?
    
    var body: some View {
        // 여기에 코드를 작성하세요.
        NavigationSplitView() {
            ListView(items: items, selectedItem: $selectedItem)
        } detail: {
            DetailView(item: selectedItem)
        }
    }
}

#Preview {
    ExerciseView37()
}
