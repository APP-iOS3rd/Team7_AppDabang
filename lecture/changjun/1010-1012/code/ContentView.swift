//
//  ContentView.swift
//  DemoProject2
//
//  Created by phang on 10/11/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct ContentView: View {
    
    var body: some View {
        
        NavigationView {

            PhangVStack {
                
                Image("SwiftIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                NavigationLink(destination: ExamplesDirectoryView()) {
                    Label("Examples", systemImage: "text.book.closed")
                        .modifier(LargeLabel())
                }
                
                Divider()
                    .frame(height: 3)
                    .background(Color.pink)
                
                NavigationLink(destination: ExercisesDirectoryView()) {
                    Label("Exercises", systemImage: "macbook")
                        .modifier(LargeLabel())
                }
                
            }
            .navigationBarTitle("LikeLion iOS - SwiftUI", displayMode: .inline)
        }
        .accentColor(.pink)
    }
}

@available(iOS 17.0, *)
#Preview {
    ContentView()
}
