//
//  NynanicListNavigationView.swift
//  DemoProject
//
//  Created by lkh on 10/31/23.
//

import SwiftUI

// 동적 리스트
// - 리스트에 표시할 데이터는 Identifiable 프로토콜을 따라야 한다.
// - id 프로퍼티 필수 : 각 항목을 고유하게 식별하는데 사용
// - Hashable 프로토콜을 따르는 모든 스위프트 타입이나 커스텀 타입이 가능
// - UUID() 메서드는 각 항목마다 고유한 ID를 자동으로 생성하는데 사용

struct ToDoItem : Identifiable, Hashable {
    var id = UUID()
    var task: String
    var imageName: String
}

struct DynamicListNavigationView: View {

    @State var listData: [ToDoItem] = [
        ToDoItem(task: "Take out the trash", imageName: "trash.circle.fill"),
        ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
        ToDoItem(task: "Wash the car", imageName: "car.fill")
    ]
    @State private var toggleStatus = true

    var body: some View {

        NavigationStack {
            // 리스트 셀은 여러 컴포넌트를 조합하여 셀에 표시할 수 있다.
            List(listData) { item in
                NavigationLink(value: item.task) {
                    HStack {
                        Image(systemName: item.imageName)
                        Text(item.task)
                    }
                }
            }
            .navigationDestination(for: String.self) { task in
                Text("Selected task = \(task)")
            }
        }


        NavigationStack {
            // 동적 리스트 ForEach 사용예
            // Section : 특정 보기 내에 계층 구조를 추가하는 데 사용할 수 있는 컨테이너 보기
            List {
                Section(header: Text("Setting")) {
                    Toggle(isOn: $toggleStatus) {
                        Text("Allow Notifications")
                    }
                }

                NavigationLink(value: listData.first ?? ToDoItem(task: "", imageName: "")) {
                    Text("test")
                }

                // 값 타입별 내비게이션
                NavigationLink(value: listData.count) {
                    Text("View Task Count")
                }

                Section(header: Text("To Do Tasks")) {
                    ForEach (listData) { item in
                        NavigationLink(value: item.task) {
                            HStack {
                                Image(systemName: item.imageName)
                                Text(item.task)
                            }
                        }

                    }
                }
            }
            .navigationDestination(for: ToDoItem.self) { item in
                Text("Number of tasks = \(item.imageName)")
            }
            .navigationDestination(for: Int.self) { count in
                Text("Number of tasks = \(count)")
            }
            .navigationDestination(for: String.self) { task in
                Text("Selected task = \(task)")
            }
            // 새로 고침 동작을 추가
            .refreshable {
                listData = [
                    ToDoItem(task: "Order dinner", imageName: "dollarsign.circle.fill"),
                    ToDoItem(task: "Call finacial advisor", imageName: "phone.fill"),
                    ToDoItem(task: "Sell the kids", imageName: "person.2.fill")
                ]
            }
        }


    }
}

#Preview {
    DynamicListNavigationView()
}
