//
//  LauchedView.swift
//  MentoringAPI
//
//  Created by phang on 11/8/23.
//

import SwiftUI

struct LauchedView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("App Name")
            Spacer()
            Text("👾 Made by Phang")
                .foregroundStyle(Color.gray)
                .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    LauchedView()
}
