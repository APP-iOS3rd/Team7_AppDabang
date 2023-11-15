//
//  todoListVIew.swift
//  WeatherApp
//
//  Created by 박선구 on 11/14/23.
//

import SwiftUI

struct TodoList: Hashable, Identifiable {
    var id: UUID = UUID()
//    var id: String
    var title: String
    var content: String
}

class TodoListStore: ObservableObject {
    @Published var todayList: [TodoList]
    
    init() {
        self.todayList = [
            TodoList(title: "오늘의 할일 1", content: "오늘 해야할 일을 입력"),
            TodoList(title: "오늘의 할일 2", content: "오늘 해야할 일을 입력")
        ]
    }
    
    func addList(title: String, content: String) {
        let linklist: TodoList = TodoList(title: title, content: content)
        todayList.append(linklist)
    }
    
}



struct todoListVIew: View {

//    @ObservedObject var todayListStore: TodoListStore = TodoListStore()
    
//    @Binding var todayMyList: [TodoList]
    
    @StateObject var todayListStore = TodoListStore()
    @State private var stackPath = NavigationPath()
    @State var title: String = ""
    @State var content: String = ""
    
//    @State var todayList: [TodoList] = [
//        TodoList(title: "오늘의 할일 1", content: "오늘 해야할 일을 입력"),
//        TodoList(title: "오늘의 할일 1", content: "오늘 해야할 일을 입력")
//    ]
//    @State var todayList = [
//        TodoList(title: "오늘의 할일 1", content: "오늘 해야할 일을 입력"),
//        TodoList(title: "오늘의 할일 1", content: "오늘 해야할 일을 입력")
//    ]
    
    var body: some View {
        Text("\(dateFormatter())")
            .padding()
            .foregroundColor(.black)
            .font(.largeTitle)
        NavigationStack(path: $stackPath){
            List{
                ForEach(todayListStore.todayList, id: \.self){ item in
                    NavigationLink(value: item) {
//                        ListCell(list: todayListStore.todayList[0])
                        VStack(alignment: .leading){
                            Text(item.title).font(.title2)
                            Text(item.content).foregroundStyle(.gray)
                        }
                    }
                    .listRowSeparatorTint(.black)
//                    .listRowBackground(Color.red)
                }
                .onDelete { item in
                    todayListStore.todayList.remove(atOffsets: item)
                }
                .onMove { from , to in
                    todayListStore.todayList.move(fromOffsets: from, toOffset: to)
                }
//                .toolbar {
//                    EditButton()
//                }
            }
            .navigationDestination(for: Int.self) { i in todoDetailView(selectedList: todayListStore.todayList[i])
            }
            .listStyle(.automatic)
//            .navigationBarTitle(dateFormatter())
//            .navigationBarItems(trailing: EditButton())
//            Button(action: {}, label: {
//                Text("일정추가")
//            })
            
            NavigationLink(destination: AddTodoView(todayListStore: self.todayListStore), label: {
                VStack{
                    Text("일정추가").font(.body)
                }
            })
        }
        
    }
    
    func dateFormatter() -> String{
        let nowDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        let str = dateFormatter.string(from: nowDate)
        return str
    }
}

struct ListCell: View {
    
    var list: TodoList
    var body: some View {
        VStack{
            Text(list.title)
        }
    }
}


#Preview {
    todoListVIew()
}
