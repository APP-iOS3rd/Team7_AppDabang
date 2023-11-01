//
//  ExerciseView34.swift
//  DemoProject2
//
//  Created by phang on 11/1/23.
//

import SwiftUI

struct ExerciseView34: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Go Second View", destination: SecondView34())
        }
    }
}

struct SecondView34: View {
    
    var body: some View {
        VStack {
            Spacer()
            Text("Second - View")
                .frame(maxWidth: .infinity)
            Spacer()
        }
        .background(Color.blue)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ExerciseView34()
}
