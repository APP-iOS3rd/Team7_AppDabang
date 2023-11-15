//
//  TabDemoView.swift
//  DemoProject2
//
//  Created by phang on 11/9/23.
//

import SwiftUI

struct TabDemoView: View {
    @State private var selection = 1
    
    var body: some View {
        VStack {
            Text("\(selection)")
            TabView(selection: $selection) {
                Text("First Content View")
                    .tabItem {
                        Image(systemName: "1.circle")
                        Text("Screen One")
                    }
                    .tag(1)
                Text("Second Content View")
                    .tabItem {
                        Image(systemName: "2.circle")
                        Text("Screen Two")
                    }
                    .tag(2)
                Text("Third Content View")
                    .tabItem {
                        Image(systemName: "3.circle")
                        Text("Screen Three")
                    }
                    .tag(3)
            }
            .font(.largeTitle)
            // 페이지 형식 -> 스와이프로 동작
            .tabViewStyle(.page)
        }
        .background(Color.teal)
    }
}

#Preview {
    TabDemoView()
}
