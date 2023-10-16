//
//  GridView.swift
//  DemoProject2
//
//  Created by phang on 10/16/23.
//

import SwiftUI

struct GridView: View {
    
    let column: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        LazyVGrid(columns: column){
            Text("Hell-o? Hell-o Hell-o Hell-o ")
                .background(Color.mint)
            Text("Hell-o? Hell-o Hell-o Hell-o ")
                .background(Color.blue)
            Text("Hell-o? Hell-o Hell-o Hell-o ")
                .background(Color.red)
            
            Text("Hell-o?")
                .background(Color.mint)
            Text("Hell-o?")
                .background(Color.blue)
            Text("Hell-o?")
                .background(Color.red)
        }
        .padding(10)
    }
}

#Preview {
    GridView()
}
