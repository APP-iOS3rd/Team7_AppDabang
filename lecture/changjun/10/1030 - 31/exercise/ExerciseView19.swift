//
//  ExerciseView19.swift
//  DemoProject2
//
//  Created by phang on 10/26/23.
//

import SwiftUI

struct ExerciseView19: View {
        
    @AppStorage("selectedItem") var selectedItem: String?
    let items = ["A", "B", "C", "D", "E"]
    
    var body: some View {
        VStack {
            NavigationView {
//                List(items, id: \.self, selection: $selectedItem) { item in
//                    NavigationLink(item) {
//                        Text(item)
//                    }
//                }
                List(items, id: \.self) { item in
                    NavigationLink(
                        destination: Text(item), 
                        tag: item,
                        selection: $selectedItem) { Text(item) }
                }
            }
            Text("ExerciseView19")
        }
    }
}

#Preview {
    ExerciseView19()
}
