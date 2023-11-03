//
//  ExerciseView29.swift
//  DemoProject2
//
//  Created by phang on 11/1/23.
//

import SwiftUI

struct Item29: Identifiable {
    var id = UUID()
    var name: String
    var isChecked: Bool
}

struct ExerciseView29: View {
    
    @State private var listData: [Item29] = [
        Item29(name: "Item1", isChecked: false), Item29(name: "Item2", isChecked: false),
        Item29(name: "Item3", isChecked: false), Item29(name: "Item4", isChecked: false),
        Item29(name: "Item5", isChecked: false), Item29(name: "Item6", isChecked: false),
        Item29(name: "Item7", isChecked: false), Item29(name: "Item8", isChecked: false),
        Item29(name: "Item9", isChecked: false), Item29(name: "Item10", isChecked: false)
    ]
        
    var body: some View {
        VStack {
            Text("SwiftUI List Quiz")
                .font(.largeTitle)
            .padding()
            
            // list
            List($listData) { $item in
                HStack {
                    Text("\(item.name)")
                    if item.isChecked {
                        Spacer()
                        Image(systemName: "checkmark")
                    }
                }
                .onTapGesture {
                    // 각각 체크 가능
//                    item.isChecked.toggle()
                    
                    // 하나만 체크 가능
                    checkOnlyOne(item.id)
                }
            }
        }
    }
    
    func checkOnlyOne(_ id: UUID) {
        for index in 0..<listData.count {
            if listData[index].id == id {
                listData[index].isChecked = true
            } else {
                listData[index].isChecked = false
            }
        }
    }
    
}

#Preview {
    ExerciseView29()
}
