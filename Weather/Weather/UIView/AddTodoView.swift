//
//  AddTodoView.swift
//  WeatherApp
//
//  Created by 박선구 on 11/15/23.
//

import SwiftUI

struct AddTodoView: View {
    @ObservedObject var todayListStore: TodoListStore = TodoListStore()
    
    @State var title: String = ""
    @State var content: String = ""
    
    var body: some View {
        VStack(alignment: .leading){
            Text(dateFormatter())
                .font(.largeTitle)

            Text("일정 추가")
                .font(.title)
            
            Spacer()
            
            Text("Title")
            TextField("title", text: $title)
            
            Text("Detail")
            TextField("detail", text: $content)
            
            Spacer()
        }
        .textFieldStyle(.roundedBorder)
        .padding()
        
            VStack(alignment: .center){
                Button(action: addContent, label: {
                    Text("추가")
                })
            }
        }
    
    func addContent() {
        if !title.isEmpty && !content.isEmpty {
            todayListStore.addList(title: title, content: content)
//            TodoListStore.addList(title: title, content: content)
            title = ""
            content = ""
        } else {
            title = ""
            content = ""
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

#Preview {
    AddTodoView()
}
