//
//  UI_Ex_02_sol.swift
//  DemoProject
//
//  Created by lkh on 10/16/23.
//

import SwiftUI

struct UI_Ex_02_sol: View {
    @State private var count = 0

    var body: some View {

        GeometryReader { geometry in
            VStack {
                Spacer()
                Text("\(count)")
                Spacer()
                Button("COUNT") {
                    count += 1
                }
                .frame(width: geometry.size.width)
                .padding(5)
                .foregroundColor(Color.white)
                .background(Color.indigo)
                .cornerRadius(5)
            }
            .background(.teal)
        }

    }
}

#Preview {
    UI_Ex_02_sol()
}
