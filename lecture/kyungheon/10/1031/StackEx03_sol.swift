//
//  StackEx03_sol.swift
//  DemoProject
//
//  Created by lkh on 10/31/23.
//

import SwiftUI

struct StackEx03_sol: View {
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .fill(Color.green)
                    .frame(width: 50, height: 50)
                Spacer()
            }
            Spacer()
            HStack {
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 50, height: 50)
            }
            Spacer()
            HStack {
                Spacer()
                Circle()
                    .fill(Color.orange)
                    .frame(width: 50, height: 50)
            }
        }
    }}

#Preview {
    StackEx03_sol()
}
