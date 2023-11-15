//
//  StartingView.swift
//  MentoringAPI
//
//  Created by phang on 11/8/23.
//

import SwiftUI

struct StartingView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("""
                    What
                    celebrity
                    do I look like?
                    """)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.bottom, 40)
                Text("""
                    얼굴 사진을 등록하면,
                    나와 닮은 연예인을 찾을 수 있어요!
                    """)
                Spacer()
                NavigationLink(destination: SelectView()) {
                    Text("시작하기")
                        .foregroundStyle(Color.white)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
                .padding(12)
                .background(Color.pink)
                .cornerRadius(10)
            }
            .padding()
        }
    }
}

#Preview {
    StartingView()
}
