//
//  GridDemoView.swift
//  DemoProject2
//
//  Created by phang on 11/8/23.
//

import SwiftUI

struct GridDemoView: View {
    private var colors: [Color] = [.pink, .teal, .orange]
//    private var gridItems = [
//        GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())
//    ]
    
//    private var gridItems: [GridItem] = [
//        GridItem(.adaptive(minimum: 50))
//    ]
    
//    private var gridItems: [GridItem] = [
//        GridItem(.fixed(100))
//    ]
    
    private var gridItems = [
        GridItem(.fixed(100)), GridItem(.adaptive(minimum: 50)), GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems, spacing: 10) {
                ForEach((0...99), id: \.self) { index in
                    CellContent_1(index: index, color: colors[index % colors.count])
                }
            }
            .padding()
        }
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridItems, spacing: 10) {
                ForEach((0...99), id: \.self) { index in
                    CellContent_1(index: index, color: colors[index % colors.count])
                }
            }
            .padding()
        }
    }
}

struct CellContent_1: View {
    var index: Int
    var color: Color
    
    var body: some View {
        Text("\(index)")
            .frame(minWidth: 75, minHeight: 50, maxHeight: .infinity)
            .background(color)
            .clipShape(.rect(cornerRadius: 8))
            .font(.largeTitle)
    }
}

#Preview {
    GridDemoView()
}
