//
//  NoResult.swift
//  MentoringAPI
//
//  Created by phang on 11/19/23.
//

import SwiftUI

struct NoResult: View {
    @EnvironmentObject var router: Router

    var body: some View {
        VStack(spacing: 50) {
            Text("아쉽게도 닮은 사람을 찾지 못했어요 🥲")
                .modifier(SubTitle2())
            Button {
                router.path.removeLast()
            } label: {
                Text("다시 하기")
                    .padding(6)
                    .fontWeight(.semibold)
            }
            .buttonStyle(.borderedProminent)
            .tint(.pink)
        }
    }
}

#Preview {
    NoResult()
}
