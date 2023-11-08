//
//  ExerciseView36.swift
//  DemoProject2
//
//  Created by phang on 11/8/23.
//

import SwiftUI

struct Item36: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var detail: String
}

struct ExerciseView36: View {
    var items = [
            Item36(name: "Apple", detail: "학명 말루스 도메스티카(Malus domestica)는 라틴어로 '친숙한 사과'란 뜻"),
            Item36(name: "Banana", detail: "바나나(영어: Banana, 문화어: 빠나나)는 파초과 파초속의 여러해살이 식물과 열매를 두루 일컫는 말"),
            Item36(name: "Cherry", detail: "벚나무의 열매. 순우리말로는 버찌라고 한다. 다만 보통 한국에서 접하는 사진의 서양버찌는 체리라 부르고 동양버찌는 버찌라고 별개로 부르는 편이 많다")
        ]
    @State private var selectedItem: Item36?

    var body: some View {
        NavigationSplitView {
            // 왼쪽에 목록 뷰를 추가하세요.
            List(items, selection: $selectedItem) { item in
                Text(item.name).tag(item)
            }
            // 오른쪽에 선택한 항목의 세부 정보를 표시하세요.
        } detail: {
            Text(selectedItem?.name ?? "Nothing")
                .font(.largeTitle)
                .padding()
            Text(selectedItem?.detail ?? "")
                .font(.body)
        }
    }
}

#Preview {
    ExerciseView36()
}
