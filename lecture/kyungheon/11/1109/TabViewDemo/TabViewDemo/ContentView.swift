//
//  ContentView.swift
//  TabViewDemo
//
//  Created by lkh on 11/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
         // TabView 콘텐트 추가
         TabView {
             Text("First Content view")
                 .tabItem {
                     Image(systemName: "1.circle")
                     Text("Screen One")
                 }

             Text("Second Content view")
                 .tabItem {
                     Image(systemName: "2.circle")
                     Text("Screen Tow")
                 }

             Text("Third Content view")
                 .tabItem {
                     Image(systemName: "3.circle")
                     Text("Screen Three")
                 }
         }
         .font(.largeTitle)
         // 뷰 페이징
         // 탭 아이템 추가시 시각적 표시 제공을 위해 tabViewStyle() 수정자를 제거
         // tabItem() 수정자를 사용하여 각 콘텐트 뷰에 탭 아이템을 적용
 //        .tabViewStyle(PageTabViewStyle())
     }
}

#Preview {
    ContentView()
}
