//
//  ExerciseView32.swift
//  DemoProject2
//
//  Created by phang on 11/1/23.
//

import SwiftUI

struct ExerciseView32: View {
    @State var title = "First View"
    
    var body: some View {
        
        NavigationStack {
            VStack {
                NavigationLink("Go Second View", 
                               destination: SecondView32(title: $title))
            }
            .onAppear { title = "First View" }
            .navigationTitle(title)
        }
    }
}

struct SecondView32: View {
    @Binding var title: String
    
    var body: some View {
        VStack {
            Text("Hello, Second View!")
        }
        .onAppear { title = "Second View" }
        .navigationTitle(title)
    }
}

#Preview {
    ExerciseView32()
}
