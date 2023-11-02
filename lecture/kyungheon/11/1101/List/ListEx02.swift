//
//  ListEx02.swift
//  DemoProject
//
//  Created by lkh on 11/1/23.
//

import SwiftUI

/*
 List 를 사용하여 다음과 같은 화면을 구현해보세요.

 화면에는 "SwiftUI List Quiz" 라는 제목이 있습니다.
 List 에는 5개의 섹션이 있으며, 각 섹션에는 "Section 1", "Section 2", ... , "Section 5" 라는 헤더가 있습니다.
 각 섹션에는 3개의 행이 있으며, 각 행에는 "Row 1", "Row 2", "Row 3" 이라는 텍스트가 있습니다.
 List 의 배경색은 회색이고, 헤더의 텍스트 색은 검은색, 행의 텍스트색은 파란색입니다.
 */

struct ListEx02: View {
    var body: some View {
        VStack {
            Text("SwiftUI List Quiz")
                .font(.largeTitle)
                .padding()
            
            List {
                ForEach(1..<6) { idx in
                    Section(header: Text("Header \(idx)")
                        .foregroundColor(.black)) {
                        ForEach(1..<4) { i in
                            Text("row \(i)")
                                .foregroundColor(.blue)
                        }
                    }
                }
            }.background(Color(.gray))
        }
    }
}

#Preview {
    ListEx02()
}
