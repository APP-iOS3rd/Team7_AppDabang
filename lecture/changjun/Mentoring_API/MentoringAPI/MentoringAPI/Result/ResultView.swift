//
//  ResultView.swift
//  MentoringAPI
//
//  Created by phang on 11/16/23.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject var router: Router
    let result: CelebrityResponse

    var body: some View {
        VStack(spacing: 30) {
            if result.info.faceCount == 0 {
                NoResult()
            } else {
                ResultList(result: result)
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    router.clear()
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                        Text("Home")
                    }
                }
            }
        }
    }
}

#Preview {
    ResultView(result: CelebrityResponse(
        info: InfoData(
            size: SizeData(width: 700, height: 934),
            faceCount: 2),
        faces: [
            FaceData(
                celebrity: CelebrityData(
                    value: "김준홍",
                    confidence: 1.0)
            ),
            FaceData(
                celebrity: CelebrityData(
                    value: "하재숙",
                    confidence: 0.596536)
            )
        ])
    )
    .environmentObject(Router())
}
