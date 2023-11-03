//
//  ExerciseView31.swift
//  DemoProject2
//
//  Created by phang on 11/1/23.
//

import SwiftUI

struct ExerciseView31: View {
    
    @State private var listData = [
        "Item1", "Item2", "Item3", "Item4", "Item5",
        "Item6", "Item7", "Item8", "Item9", "Item10"
    ]
    
    var body: some View {
        Text("SwiftUI List Quiz")
            .font(.largeTitle)
            .padding()
        
        // Delet 버튼으로 삭제
        List(listData.indices, id: \.self) { idx in
            HStack {
                Text(listData[idx])
                Spacer()
                Button("Delete") {
                    listData.remove(at: idx)
                }
                .tint(.red)
            }
        }
        
        // onDelete 드래그 삭제
        List {
            ForEach(listData, id: \.self) { item in
                Text(item)
            }
            .onDelete(perform: { indexSet in
                listData.remove(atOffsets: indexSet)
            })
        }
        
    }

}

#Preview {
    ExerciseView31()
}
