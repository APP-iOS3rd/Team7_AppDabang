//
//  StartingView.swift
//  MentoringAPI
//
//  Created by phang on 11/8/23.
//

import SwiftUI

struct StartingView: View {
    @StateObject var router = Router()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    Text("""
                        What
                        celebrity
                        do I look like?
                        """)
                        .modifier(MainTitle())
                        .padding(.bottom, 40)
                    Text("""
                        얼굴 사진을 등록하면,
                        나와 닮은 연예인을 찾을 수 있어요!
                        """)
                        .modifier(SubTitle3())
                }
                Spacer()
                NavigationLink(value: Route.selectView) {
                    Text("시작하기")
                        .foregroundStyle(Color.white)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
                .padding(12)
                .background(Color.pink)
                .cornerRadius(8)
                .padding([.bottom, .horizontal], 20)
                .navigationDestination(for: Route.self) { _ in
                    SelectView()
                }
            }
            .padding()
        }
        .environmentObject(router)
        .tint(.pink)
    }
}

#Preview {
    StartingView()
}
