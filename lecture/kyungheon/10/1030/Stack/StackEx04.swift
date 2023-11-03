//
//  StackEx04.swift
//  DemoProject
//
//  Created by lkh on 10/30/23.
//

import SwiftUI

// MARK: - SwiftUI 스택 정렬 예제 04
/*
 다음 코드는 두 개의 텍스트 뷰를 글자 아랫부분을 기준으로 수평으로 정렬하고, 첫 번째 텍스트 뷰는 왼쪽에, 두 번째 텍스트 뷰는 오른쪽에 배치하려고 한다.

 alignment 파라미터를 수정하여 원하는 결과를 얻도록 코드를 수정해보세요.
 */
struct StackEx04: View {
    var body: some View {
        HStack(alignment: .bottom) {
            Text("Hello")
                .font(.largeTitle)
            Text("World")
        }
        .padding()
    }
}

#Preview {
    StackEx04()
}
