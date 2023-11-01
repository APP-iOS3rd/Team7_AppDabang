//
//  ExerciseView33.swift
//  DemoProject2
//
//  Created by phang on 11/1/23.
//

import SwiftUI

class Ex33: ObservableObject {
    @Published var text = ""
}

struct ExerciseView33: View {
    @StateObject var ex33 = Ex33()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 50) {
                Text(ex33.text.isEmpty ? "Nothing" : ex33.text)
                
                NavigationLink("Go Second View", destination: SecondView33().environmentObject(ex33))
            }
            .navigationTitle("Nav Exercise - 02")
        }
    }
}

struct SecondView33: View {
    @EnvironmentObject var ex33: Ex33
    
    var body: some View {
        VStack {
            TextEditor(text: $ex33.text)
        }
        .padding()
    }
}

#Preview {
    ExerciseView33()
}
