//
//  todoDetailView.swift
//  WeatherApp
//
//  Created by 박선구 on 11/14/23.
//

import SwiftUI

struct todoDetailView: View {
    
    let selectedList: TodoList
    
    
    var body: some View {
        Form{
            Section(content: {
                Text(selectedList.title)
                    .font(.largeTitle)
                
                Text(selectedList.content)
                    .font(.title)
            }, header: {
                Text(dateFormatter())
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

//#Preview {
//    todoDetailView(selectedList: TodoList[0])
//}

