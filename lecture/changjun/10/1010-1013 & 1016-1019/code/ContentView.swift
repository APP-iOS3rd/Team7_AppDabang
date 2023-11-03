//
//  ContentView.swift
//  DemoProject2
//
//  Created by phang on 10/11/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct ContentView: View {
    
    private let githubURL = "https://github.com/APP-iOS3rd/Team7_AppDabang"
    private let notionURL = "https://www.notion.so/7-3407b53edb674d36b0076c7196cd8cb9?p=68971a51701c4e4791102115ec978689&pm=s"
    
    var body: some View {
        
        NavigationView {

            VStack(spacing: 30) {

                Image("SwiftIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                NavigationLink(destination: ExamplesDirectoryView()) {
                    Label("Examples", systemImage: "text.book.closed")
                        .modifier(LargeLabel())
                }
                
                Divider()
                    .frame(height: 2)
                    .background(Color.pink)
                
                NavigationLink(destination: ExercisesDirectoryView()) {
                    Label("Exercises", systemImage: "macbook")
                        .modifier(LargeLabel())
                }
                
                Divider()
                    .frame(height: 2)
                    .background(Color.pink)
                
                NavigationLink(destination: MyWebView(urlToLoad: githubURL)) {
                    Label("Team GitHub", systemImage: "shared.with.you")
                        .modifier(LargeLabel())
                }
                
                Divider()
                    .frame(height: 2)
                    .background(Color.pink)
                
                NavigationLink(destination: MyWebView(urlToLoad: notionURL)) {
                    Label("Team Notion", systemImage: "doc.richtext")
                        .modifier(LargeLabel())
                }
                
            }
            .padding(20)
            .navigationBarTitle("LikeLion iOS - SwiftUI", displayMode: .inline)
        }
        .accentColor(.pink)
    }
    
}

@available(iOS 17.0, *)
#Preview {
    ContentView()
}
