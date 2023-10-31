//
//  StackEx01_sol.swift
//  DemoProject
//
//  Created by lkh on 10/31/23.
//

import SwiftUI

struct StackEx01_sol: View {
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                Text("Hello")
                    .font(.largeTitle)
                    .frame(alignment: .leadingLastTextBaseline)
                Text("World")
                    .frame(alignment: .leadingLastTextBaseline)
            }
        }
    }
}

#Preview {
    StackEx01_sol()
}
