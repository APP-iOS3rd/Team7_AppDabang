//
//  ListNavigationView.swift
//  DemoProject2
//
//  Created by phang on 10/31/23.
//

import SwiftUI

// 동적 리스트
// - 리스트에 표시할 데이터는 Identifiable 프로토콜을 따라야 한다.
// - id 프로퍼티 필수 : 각 항목을 고유하게 식별하는데 사용
// - Hashable 프로토콜을 따르는 모든 스위프트 타입이나 커스텀 타입이 가능
// - UUID() 메서드는 각 항목마다 고유한 ID를 자동으로 생성하는데 사용
struct ToDoItem: Identifiable, Hashable {
    var id = UUID()
    var task: String
    var imageName: String
}

struct ListNavigationView: View {
    
    @State var listData: [ToDoItem] = [
        ToDoItem(task: "Take out the trash", imageName: "trash.circle.fill"),
        ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
        ToDoItem(task: "Wash the car", imageName: "car.fill")
    ]
    @State private var toggleStatus = false
    @State private var stackPath = NavigationPath()
    
    var body: some View {
        
        Text("\(stackPath.count)")
        
//        NavigationStack {
//            List(listData) { item in
//                NavigationLink(value: item.task) {
//                    HStack {
//                        Image(systemName: item.imageName)
//                        Text(item.task)
//                    }
//                }
//            }
//            .navigationDestination(for: String.self) { task in
//                Text("Selected Task = \(task)")
//            }
//        }
        
        // 가장 단순한 형태의 List 표현
        // 하나 이상 뷰의 각 행을 수직 방향의 목록으로 정보를 표현
        List {
            Text("Wash the car")
                .listRowSeparator(.hidden) // 구분선 숨김
            Text("Vaccum house")
            Text("Pick up kids from school bus @ 3pm")
                .listRowSeparatorTint(.red) // 구분선 색상 변경
            Text("Action the kids on eBay")
            Text("order Pizza for dinner")
                .listRowBackground(Color.orange) // 배경 뷰 설정
        }

        // 여러 컴포넌트를 조합하여 표시, 정적
//        List {
//            HStack {
//                Image(systemName: "trash.circle.fill")
//                Text("Take out the trash")
//            }
//            HStack {
//                Image(systemName: "person.2.fill")
//                Text("Pick up the kids")
//            }
//            HStack {
//                Image(systemName: "car.fill")
//                Text("Wash the car")
//            }
//        }
        
//        // 동적 리스트
//        List(listData) { item in
//            HStack {
//                Image(systemName: item.imageName)
//                Text(item.task)
//            }
//        }
        
        NavigationStack(path: $stackPath) {
            // 동적 + 정적 + 섹션
            List {
                Section("Setting") {
                    Toggle(isOn: $toggleStatus) {
                        Text("Allow Notification")
                    }
                }
                
                NavigationLink(value: listData.first ?? ToDoItem(task: "", imageName: "")) {
                    Text("View First Image Name")
                }
                
                // 값 타입별 네이게이션
                NavigationLink(value: listData.count) {
                    Text("View Test Count")
                }
                
                Section("To Do Tasks") {
                    ForEach(listData) { item in
                        NavigationLink(value: item.task) {
                            HStack {
                                Image(systemName: item.imageName)
                                Text(item.task)
                            }
                        }
                    }
                    .onDelete(perform: { _ in
                        // 데이터 소스에서 항목을 삭제하는 코드
                    })
                    .onMove(perform: { indices, newOffset in
                        // 항목을 재배열하는 코드
                    })
                }
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button(action: {print("press navi button")}) {
                    Text("Hello")
                }
            }
            .navigationDestination(for: ToDoItem.self) { item in
                Text("Image Name = \(item.imageName)")
            }
            .navigationDestination(for: Int.self) { count in
                Text("Number Of Tasks = \(count)")
            }
            .navigationDestination(for: String.self) { task in
                Text("Selected Task = \(task)")
            }
            // 새로고침
            .refreshable {
                self.listData = [
                    ToDoItem(task: "Order dinner", imageName: "dollarsign.circle.fill"),
                    ToDoItem(task: "Call financial advisor", imageName: "phone.fill"),
                    ToDoItem(task: "Sell the kids", imageName: "person.2.fill")
                ]
            }
        }
        
    }
}

#Preview {
    ListNavigationView()
}
