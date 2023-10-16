//
//  ExerciseView13.swift
//  DemoProject2
//
//  Created by phang on 10/16/23.
//

import SwiftUI

struct ExerciseView13: View {
    @State private var count = 0
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Text("\(count)")
            
            Spacer()
            
            Button {
                addCount()
            } label: {
                Text("COUNT")
                    .frame(maxWidth: .infinity)
            }
            .modifier(CustomPinkButton())
        }
        .padding(10)
    }
    
    private func addCount() {
        self.count += 1
    }
}

#Preview {
    ExerciseView13()
}
