//
//  ExerciseView28.swift
//  DemoProject2
//
//  Created by phang on 11/1/23.
//

import SwiftUI

struct ExerciseView28: View {
    
    @State private var sectionData = [
        "Section 1", "Section 2", "Section 3", "Section 4", "Section 5"
    ]
    @State private var rowData = [
        "Row 1", "Row 2", "Row 3"
    ]
    
    var body: some View {
        VStack {
            Text("SwiftUI List Quiz")
                .font(.largeTitle)
            .padding()
            
            // list
            List(sectionData, id: \.self) { section in
                Section {
                    ForEach(rowData, id: \.self) { row in
                        Text(row)
                            .foregroundStyle(Color.blue)
                            .listRowBackground(Color.gray)
                    }
                } header: {
                    Text(section)
                } footer: {
                    HStack {
                        Spacer()
                        Text("\(rowData.count)")
                    }
                }
            }
//            .listStyle(.grouped)
        }
    }
}

#Preview {
    ExerciseView28()
}
