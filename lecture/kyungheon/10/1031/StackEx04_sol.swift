//
//  StackEx04_sol.swift
//  DemoProject
//
//  Created by lkh on 10/31/23.
//

import SwiftUI

struct StackEx04_sol: View {
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                Text("Hello")
                    .font(.largeTitle)
                    .frame(alignment: .leadingLastTextBaseline)
                Spacer()
                Text("World")
                    .frame(alignment: .leadingLastTextBaseline)
            }
        }
        .padding()
    }
}

#Preview {
    StackEx04_sol()
}
