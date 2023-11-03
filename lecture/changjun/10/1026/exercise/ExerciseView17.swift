//
//  ExerciseView17.swift
//  DemoProject2
//
//  Created by phang on 10/26/23.
//

import SwiftUI

struct ExerciseView17: View {
    
    @AppStorage("mytab") var mytab = 1
    
    var body: some View {
        TabView(selection: $mytab) {
            ExerciseView17_1()
                .tabItem {
                    Image(systemName: "a.circle.fill")
                    Text("A Tab")
                }
                .tag(1)
            
            ExerciseView17_2()
                .tabItem {
                    Image(systemName: "b.circle.fill")
                    Text("B Tab")
                }
                .tag(2)
        }
    }
}

struct ExerciseView17_1: View {
    var body: some View {
        VStack {
            Text("A")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}

struct ExerciseView17_2: View {
    var body: some View {
        VStack {
            Text("B")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    ExerciseView17()
}
