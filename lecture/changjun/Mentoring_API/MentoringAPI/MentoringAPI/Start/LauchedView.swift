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
            Text("U Look Like")
                .font(.largeTitle)
                .bold()
            Spacer()
            Text("👾 Made by Phang")
                .foregroundStyle(Color.gray)
                .font(.footnote)
                .padding(.bottom, 20)
        }
        .padding()
    }
}

#Preview {
    LauchedView()
}
