//
//  LifeCycleDemoView.swift
//  DemoProject2
//
//  Created by phang on 10/26/23.
//

import SwiftUI

struct LifeCycleDemoView: View {
    var body: some View {
        TabView {
            LifeCycleFirstTabView()
                .tabItem {
                    Image(systemName: "01.circle")
                    Text("First")
                }
            
            LifeCycleSecondTabView()
                .tabItem {
                    Image(systemName: "02.circle")
                    Text("Second")
                }
        }
    }
}

#Preview {
    LifeCycleDemoView()
}
