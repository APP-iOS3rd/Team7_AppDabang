//
//  GridRowDemoView.swift
//  DemoProject2
//
//  Created by phang on 11/9/23.
//

import SwiftUI

struct GridRowDemoView: View {
    var body: some View {
        Grid(horizontalSpacing: 10, verticalSpacing: 30) {
            
            GridRow(alignment: .top) {
                CellContent_2(index: 0, color: .mint)
                Image(systemName: "record.circle.fill")
                    .gridColumnAlignment(.leading)
                Image(systemName: "record.circle.fill")
                    .gridCellAnchor(.center)
                Image(systemName: "record.circle.fill")
                    .gridCellAnchor(.bottom)
                CellContent_2(index: 0, color: .mint)
            }
            .font(.largeTitle)
            
            GridRow {
                ForEach(1...5, id: \.self) { index in
                    if index % 2 == 1 {
                        CellContent_2(index: index, color: .orange)
                    } else {
                        // 비어있는 cell 넣기
                        Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                    }
                }
            }
            GridRow {
                ForEach(6...8, id: \.self) { index in
                    CellContent_2(index: index, color: .pink)
                }
            }
            GridRow {
                ForEach(11...15, id: \.self) { index in
                    CellContent_2(index: index, color: .teal)
                }
            }
            CellContent_2(index: 16, color: .gray)
            
            // 열 확장
            GridRow {
                CellContent_2(index: 17, color: .cyan)
                    .gridCellColumns(2)
                CellContent_2(index: 18, color: .pink)
                // 현재 최대 보다 column 늘어나면 다른 부분에 변화
                    .gridCellColumns(3)
            }
        }
        .padding()
    }
}

struct CellContent_2: View {
    var index: Int
    var color: Color
    
    var body: some View {
        Text("\(index)")
            .frame(minWidth: 60, maxWidth: .infinity, minHeight: 100)
            .background(color)
            .clipShape(.rect(cornerRadius: 8))
            .font(.largeTitle)
    }
}

#Preview {
    GridRowDemoView()
}
