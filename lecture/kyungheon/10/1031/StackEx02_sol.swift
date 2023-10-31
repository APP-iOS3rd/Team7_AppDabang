//
//  StackEx02_sol.swift
//  DemoProject
//
//  Created by lkh on 10/31/23.
//

import SwiftUI

struct StackEx02_sol: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
            Rectangle()
                .fill(Color.blue)
                .frame(width: 50, height: 50)
        }
    }
}

#Preview {
    StackEx02_sol()
}
