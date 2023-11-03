//
//  StackEx05_sol.swift
//  DemoProject
//
//  Created by lkh on 10/31/23.
//

import SwiftUI

struct StackEx05_sol: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.yellow)
                Image(systemName: "moon.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.gray)
                Image(systemName: "sun.max.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.orange)
            }
            
            VStack(alignment: .trailing) {
                Image(systemName: "arrow.up.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.red)
                Image(systemName: "arrow.right.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.green)
                Image(systemName: "arrow.down.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)
            }
        }
    }
}

#Preview {
    StackEx05_sol()
}
