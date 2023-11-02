//
//  ListEx05.swift
//  DemoProject
//
//  Created by lkh on 11/1/23.
//

import SwiftUI

/*
 화면에는 "SwiftUI List Quiz" 라는 제목이 있습니다.
 List 에는 10개의 행이 있으며, 각 행에는 "Item 1", "Item 2", ... , "Item 10" 이라는 텍스트와 오른쪽에 삭제 버튼이 있습니다.
 삭제 버튼을 탭하면 해당 행이 삭제되고, 나머지 행들이 재정렬됩니다.
 */

struct ListEx05: View {
    @State private var itemArr: [Int] = Array(1...10)
    
    var body: some View {
        Text("SwiftUI List Quiz")
            .font(.largeTitle)
            .padding()
        
        List(itemArr.indices, id: \.self) { idx in
            HStack {
                Text("\(itemArr[idx])")
                  
                Spacer()
               
                Button("Remove") {
                    pressed(idx)
                }
                .foregroundColor(Color.white)
                .background(Color.indigo)
                .cornerRadius(10)
            }
        }
    }
    
    func pressed(_ idx: Int) {
        itemArr.remove(at: idx)
    }
}

#Preview {
    ListEx05()
}
