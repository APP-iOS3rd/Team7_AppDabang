//
//  StackEx02.swift
//  DemoProject
//
//  Created by lkh on 10/30/23.
//

import SwiftUI

// MARK: - SwiftUI 스택 정렬 예제 02
/*
 다음 코드는 ZStack을 사용하여 두 개의 Rectangle 뷰를 겹치게 하려고 합니다.

 alignment 매개변수를 사용하여 첫 번째 Rectangle 뷰가 왼쪽 상단에, 두 번째 Rectangle 뷰가 오른쪽 하단에 위치하도록 코드를 수정해보세요.
 */
struct StackEx02: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
            Rectangle()
                .fill(Color.blue)
                .frame(width: 50, height: 50)
        }
    }
}

#Preview {
    StackEx02()
}
