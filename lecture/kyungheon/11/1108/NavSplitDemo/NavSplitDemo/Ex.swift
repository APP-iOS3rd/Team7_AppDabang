//
//  Ex01.swift
//  NavSplitDemo
//
//  Created by lkh on 11/8/23.
//

import SwiftUI

// MARK: - NavigationSplitView 예제 01
/*
 NavigationSplitView를 사용하여 iPad에서 가로 방향으로 화면을 분할하고, 왼쪽에는 목록 뷰, 오른쪽에는 선택한 항목의 세부 정보를 표시하는 앱을 만드세요.
 */

//struct Item: Identifiable, Hashable {
//    var id = UUID()
//    var name: String
//    var detail: String
//}
//
//struct Ex01: View {
//    var items = [
//                    Item(name: "Apple", detail: "학명 말루스 도메스티카(Malus domestica)는 라틴어로 '친숙한 사과'란 뜻"),
//                    Item(name: "Banana", detail: "바나나(영어: Banana, 문화어: 빠나나)는 파초과 파초속의 여러해살이 식물과 열매를 두루 일컫는 말"),
//                    Item(name: "Cherry", detail: "벚나무의 열매. 순우리말로는 버찌라고 한다. 다만 보통 한국에서 접하는 사진의 서양버찌는 체리라 부르고 동양버찌는 버찌라고 별개로 부르는 편이 많다")
//                ]
//
//        @State private var selectedItem: Item?
//        @State private var columnVisibility = NavigationSplitViewVisibility.all
//
//        var body: some View {
//            NavigationSplitView(columnVisibility: $columnVisibility) {
//                // 사이드바 열
//                List(items, id: \.self, selection: $selectedItem) { item in
//                    Text(item.name).tag(item.name)
//                }
//            } detail: {
//                // 디테일 열
//                if let selectedItem {
//                    Text(selectedItem.detail)
//                } else {
//                    Text("Select a item")
//                }
//
//            }  // nsv
//            .navigationSplitViewStyle(.balanced)
//
//        }
//}

//
//#Preview {
//    Ex01()
//}
