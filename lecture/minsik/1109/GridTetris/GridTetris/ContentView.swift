//
//  ContentView.swift
//  GridTetris
//
//  Created by 조민식 on 11/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black
            
            Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                GridRow() {
                    ForEach(1...15, id: \.self) { index in
                        CellContent(index: index, color: .gray)
                        
                    }
                }
                GridRow() {
                    ForEach(16...30, id: \.self) { index in
                        if (index == 16 || index == 30) {
                            CellContent(index: index, color: .gray)
                        } else {
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                    }
                }
                
                GridRow() {
                    ForEach(31...45, id: \.self) { index in
                        if (index == 31 || index == 45) {
                            CellContent(index: index, color: .gray)
                        } else {
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                    }
                }
                
                GridRow() {
                    ForEach(46...60, id: \.self) { index in
                        if (index == 46 || index == 60) {
                            CellContent(index: index, color: .gray)
                        } else {
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                    }
                }
                
                GridRow() {
                    ForEach(61...75, id: \.self) { index in
                        if (index == 61 || index == 75) {
                            CellContent(index: index, color: .gray)
                        } else if (index == 68) {
                            CellContent(index: index, color: .yellow)
                        } else {
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                    }
                }
                
                GridRow() {
                    ForEach(76...90, id: \.self) { index in
                        if (index == 76 || index == 90) {
                            CellContent(index: index, color: .gray)
                        } else if (index == 83 || index == 84) {
                            CellContent(index: index, color: .yellow)
                        } else {
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                    }
                }
                
                GridRow() {
                    ForEach(91...105, id: \.self) { index in
                        if (index == 91 || index == 105) {
                            CellContent(index: index, color: .gray)
                        } else if (96 <= index && index <= 101) {
                            CellContent(index: index,color: .yellow)
                        } else {
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                    }
                }
                
                GridRow() {
                    ForEach(106...120, id: \.self) { index in
                        if (index == 106 || index == 120) {
                            CellContent(index: index, color: .gray)
                        } else if (index == 113 || index == 114) {
                            CellContent(index: index, color: .yellow)
                        } else {
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                    }
                }
                GridRow() {
                    ForEach(121...135, id: \.self) { index in
                        if (index == 121 || index == 135) {
                            CellContent(index: index, color: .gray)
                        } else if (index == 127 || index == 130) {
                            CellContent(index: index, color: .yellow)
                        } else if (index == 128 || index == 129) {
                            CellContent(index: index, color: .green)
                        } else {
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                    }
                }
                GridRow() {
                    ForEach(136...150, id: \.self) { index in
                        if (index == 136 || index == 150) {
                            CellContent(index: index, color: .gray)
                        } else if (index == 143 || index == 144) {
                            CellContent(index: index, color: .green)
                        } else {
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                    }
                }
                GridRow() {
                    ForEach(151...165, id: \.self) { index in
                        if (index == 151 || index == 165) {
                            CellContent(index: index, color: .gray)
                        } else if (index == 157 || index == 158) {
                            CellContent(index: index, color: .blue)
                        } else if (index == 159 || index == 160) {
                            CellContent(index: index, color: .orange)
                        } else {
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                    }
                }
                GridRow() {
                    ForEach(166...180, id: \.self) { index in
                        if (index == 166 || index == 180) {
                            CellContent(index: index, color: .gray)
                        } else if (index == 172 || index == 173) {
                            CellContent(index: index, color: .blue)
                        } else if (index == 174 || index == 175) {
                            CellContent(index: index, color: .orange)
                        } else {
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                    }
                }
                GridRow() {
                    ForEach(181...195, id: \.self) { index in
                        if (index == 181 || index == 195) {
                            CellContent(index: index, color: .gray)
                        } else if (index == 186 || index == 187) {
                            CellContent(index: index, color: .red)
                        } else if (index == 188 || index == 189) {
                            CellContent(index: index, color: .teal)
                        } else if (index == 190 || index == 191) {
                            CellContent(index: index, color: .yellow)
                        } else {
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                    }
                }
                GridRow() {
                    ForEach(196...210, id: \.self) { index in
                        if (index == 196 || index == 210) {
                            CellContent(index: index, color: .gray)
                        } else if (index == 202 || index == 203) {
                            CellContent(index: index, color: .red)
                        } else if (index == 204) {
                            CellContent(index: index,color: .teal)
                        } else if (index == 205) {
                            CellContent(index: index,color: .yellow)
                        } else {
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                    }
                }
                GridRow() {
                    ForEach(211...225, id: \.self) { index in
                        if (index == 211 || index == 225) {
                            CellContent(index: index, color: .gray)
                        } else if (215 <= index && index <= 218) {
                            CellContent(index: index,color: .blue)
                        } else if (index == 219) {
                            CellContent(index: index,color: .teal)
                        } else if (index == 220) {
                            CellContent(index: index,color: .yellow)
                        } else if (index == 221 || index == 222) {
                            CellContent(index: index, color: .red)
                        } else {
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                    }
                }
                GridRow() {
                    ForEach(226...240, id: \.self) { index in
                        if (index == 226 || index == 240) {
                            CellContent(index: index, color: .gray)
                        } else if (index == 231 || index == 232) {
                            CellContent(index: index,color: .orange)
                        } else if (index == 233 || index == 234) {
                            CellContent(index: index,color: .green)
                        } else if (index == 235 || index == 236) {
                            CellContent(index: index,color: .red)
                        } else {
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                    }
                }
                GridRow() {
                    ForEach(241...255, id: \.self) { index in
                        if (index == 241 || index == 255) {
                            CellContent(index: index, color: .gray)
                        } else if (index == 245 || index == 246) {
                            CellContent(index: index,color: .orange)
                        } else if (index == 247) {
                            CellContent(index: index,color: .blue)
                        } else if (index == 248) {
                            CellContent(index: index,color: .green)
                        } else if (249 <= index && index <= 252) {
                            CellContent(index: index,color: .brown)
                        } else {
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                    }
                }
                
                GridRow() {
                    ForEach(256...270, id: \.self) { index in
                        if (index == 256 || index == 270) {
                            CellContent(index: index, color: .gray)
                        } else if (index == 261) {
                            CellContent(index: index,color: .yellow)
                        } else if (index == 262) {
                            CellContent(index: index,color: .blue)
                        } else if (index == 263) {
                            CellContent(index: index,color: .green)
                        } else if (index == 264 || index == 265) {
                            CellContent(index: index,color: .orange)
                        } else if (index == 266) {
                            CellContent(index: index,color: .red)
                        } else {
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                    }
                }
                
                GridRow() {
                    ForEach(271...285, id: \.self) { index in
                        if (index == 271 || index == 285) {
                            CellContent(index: index, color: .gray)
                        } else if (274 <= index && index <= 276) {
                            CellContent(index: index,color: .yellow)
                        } else if (index == 277) {
                            CellContent(index: index,color: .blue)
                        } else if (278 <= index && index <= 279) {
                            CellContent(index: index,color: .orange)
                        } else if (index == 280) {
                            CellContent(index: index,color: .green)
                        } else if (281 <= index && index <= 283) {
                            CellContent(index: index,color: .red)
                        } else {
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                    }
                }
                
                GridRow() {
                    ForEach(286...300, id: \.self) { index in
                        if (index == 286 || index == 300) {
                            CellContent(index: index, color: .gray)
                        } else if (index == 292) {
                            CellContent(index: index,color: .blue)
                        } else if (index == 293 || index == 294 || index == 295) {
                            CellContent(index: index,color: .green)
                        } else {
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                    }
                }
                
                GridRow() {
                    ForEach(301...315, id: \.self) { index in
                        if (index == 301 || index == 315) {
                            CellContent(index: index, color: .gray)
                        } else if (index == 308 || index == 309 ) {
                            CellContent(index: index,color: .brown)
                        } else {
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                    }
                }
                
                GridRow() {
                    ForEach(316...330, id: \.self) { index in
                        if (index == 316 || index == 330) {
                            CellContent(index: index, color: .gray)
                        } else if (index == 323 || index == 324 ) {
                            CellContent(index: index,color: .brown)
                        } else {
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                    }
                }
                
                GridRow() {
                    ForEach(331...345, id: \.self) { index in
                        if (index == 331 || index == 345) {
                            CellContent(index: index, color: .gray)
                        } else if (index == 338 || index == 339 ) {
                            CellContent(index: index,color: .brown)
                        } else {
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                    }
                }
                GridRow() {
                    ForEach(346...360, id: \.self) { index in
                        if (index == 346 || index == 360) {
                            CellContent(index: index, color: .gray)
                        } else if (index == 353 || index == 354 ) {
                            CellContent(index: index,color: .brown)
                        } else {
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                    }
                }
                
                GridRow() {
                    ForEach(361...375, id: \.self) { index in
                        CellContent(index: index, color: .gray)
                        
                    }
                }
            }
        }
      
    }
}

struct CellContent: View {
    var index: Int
    var color: Color
    
    var body: some View {
        Text("")
            .frame(minWidth: 10,maxWidth: .infinity, minHeight: 30)
            .background(color)
            .border(.black)
            
            
    }
}

#Preview {
    ContentView()
}
