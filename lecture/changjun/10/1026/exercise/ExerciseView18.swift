//
//  ExerciseView18.swift
//  DemoProject2
//
//  Created by phang on 10/26/23.
//

import SwiftUI

struct ExerciseView18: View {
    
    @AppStorage("username") var name = ""
    
    var body: some View {
        VStack {
            Text("Je m'appelle \(!name.isEmpty ? name : "????")😎")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            HStack {
                Text("Name")
                TextField("????", text: $name)
                    .textFieldStyle(.roundedBorder)
            }
        }
        .padding()
    }
}

#Preview {
    ExerciseView18()
}
