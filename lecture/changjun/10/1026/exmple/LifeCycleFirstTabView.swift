//
//  LifeCycleDemoFirstTabView.swift
//  DemoProject2
//
//  Created by phang on 10/26/23.
//

/**
 p.259
 보일 때, 감추어 질 때

 - onAppear() 수정자 : 뷰가 나타날 때 실행
 - onDisappear() 수정자 : 뷰가 사라질 때 실행
 
 # task() 수정자 page.262

 뷰를 만들 때 비동기 작업을 시작
 - 비동기 작업이 SwiftUI 뷰의 컨텍스트에서 시작하는 방법
 */

import SwiftUI

struct LifeCycleFirstTabView: View {
    
    @State private var title = "View One"
    @State private var isTitleView = false
    
    var body: some View {
        VStack {
            Text(title)
                .onAppear(perform: {
                    print("onAppear triggered")
                })
                .onDisappear(perform: {
                    print("onDisappear triggered")
                })
                .task(priority: .background) {
                    title = await changeTitle()
                    isTitleView = await enableTitleView()
                }
            
            if isTitleView {
                Text("금요일 같은 목요일")
                    .font(.title)
            }
        }
    }
    
    func enableTitleView() async -> Bool {
        sleep(3)
        return true
    }
    
    func changeTitle() async -> String {
        sleep(3)
        return "비동기 처리 완료"
    }
    
}

#Preview {
    LifeCycleFirstTabView()
}
