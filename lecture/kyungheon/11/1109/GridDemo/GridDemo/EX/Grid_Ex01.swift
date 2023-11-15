//
//  Grid_Ex01.swift
//  GridDemo
//
//  Created by lkh on 11/8/23.
//

import SwiftUI

// 3x3, 4x4, ?x?

struct Grid_Ex01: View {
    let gridItems: GridItem = GridItem(.fixed(100))
    let itemColumns1: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    let itemColumns2: [GridItem] = Array(repeating: GridItem(.flexible()), count: 4)
    let itemColumns3: [GridItem] = Array(repeating: GridItem(.flexible()), count: 5)

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: itemColumns1, spacing: 5) {
                    ForEach(0..<9, id: \.self) { idx in
                        Text("\(idx)")
                    }
                }
                .padding()
            }
            
            ScrollView {
                LazyVGrid(columns: itemColumns2, spacing: 5) {
                    ForEach(0...15, id: \.self) { idx in
                        Text("\(idx)")
                    }
                }
                .padding()
            }
            
            ScrollView {
                LazyVGrid(columns: itemColumns3, spacing: 5) {
                    ForEach(0..<25, id: \.self) { idx in
                        Text("\(idx)")
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    Grid_Ex01()
}
