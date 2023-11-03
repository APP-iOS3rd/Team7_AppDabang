//
//  StackEx05.swift
//  DemoProject
//
//  Created by lkh on 10/30/23.
//

import SwiftUI

// MARK: - SwiftUI 스택 정렬 예제 05
/*
다음 코드는 세 개의 텍스트 뷰를 수직으로 정렬하고, 첫 번째 텍스트 뷰는 위에, 두 번째 텍스트 뷰는 중앙에, 세 번째 텍스트 뷰는 아래에 배치하려고 한다.

원하는 결과를 얻도록 코드를 수정해보세요.
 ????
 */
struct StackEx05: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("One")
            Text("Two")
            Text("Three")
        }
    }
}

#Preview {
    StackEx05()
}
