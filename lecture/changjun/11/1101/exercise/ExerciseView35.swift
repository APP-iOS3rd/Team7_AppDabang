//
//  ExerciseView35.swift
//  DemoProject2
//
//  Created by phang on 11/1/23.
//

import SwiftUI

struct ExerciseView35: View {
    @State var text = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 50) {
                Text("Currnet Text = \(text.isEmpty ? "nothing" : text)")
                
                NavigationLink("Go Second View", destination: SecondView35(text: $text))
            }
        }
    }
}

struct SecondView35: View {
    @Binding var text: String
    @State var isEdit = false
    
    var body: some View {
        VStack {
            TextField("nothing", text: $text)
                .textFieldStyle(.roundedBorder)
                .disabled(!isEdit)
        }
        .padding()
        .toolbar {
            Button(isEdit ? "Lock" : "Edit") {
                isEdit.toggle()
            }
        }
    }
}

#Preview {
    ExerciseView35()
}
