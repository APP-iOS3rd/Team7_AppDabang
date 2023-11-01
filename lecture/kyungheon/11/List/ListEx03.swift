//
//  ListEx03.swift
//  DemoProject
//
//  Created by lkh on 11/1/23.
//

import SwiftUI

/*
 화면에는 "SwiftUI List Quiz" 라는 제목이 있습니다.
 List 에는 10개의 행이 있으며, 각 행에는 "Item 1", "Item 2", ... , "Item 10" 이라는 텍스트와 오른쪽에 체크마크 아이콘이 있습니다.
 체크마크 아이콘은 기본적으로 숨겨져 있으며, 행을 선택하면 보이게 됩니다.
 다른 행을 탭하면 이전에 선택된 행의 체크마크 아이콘이 사라지고, 새로 선택된 행의 체크마크 아이콘이 보이게 됩니다.
 */

struct ListEx03: View {
    @State private var click: Int? = nil
    
    var body: some View {
        VStack {
            Text("SwiftUI List Quiz")
                .font(.largeTitle)
                .padding()
            
            List {
                ForEach(0..<10, id: \.self) { idx in
                    HStack {
                        Text("Item \(idx+1)")
                           
                        Spacer()
                        if click == idx {
                            Image(systemName: "checkmark")
                        }
                    }
                    .onTapGesture {
                        click = idx
                    }
                    .foregroundColor(.blue)
                }
            }
            .background(Color(.gray))
        }
    }
}

#Preview {
    ListEx03()
}
