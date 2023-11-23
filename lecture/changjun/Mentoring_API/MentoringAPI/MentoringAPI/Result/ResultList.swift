//
//  Result.swift
//  MentoringAPI
//
//  Created by phang on 11/19/23.
//

import SwiftUI

struct ResultList: View {
    @EnvironmentObject var router: Router
//    @State private var isOpen = false
    private let lineWidth: CGFloat = 120
    let result: CelebrityResponse
    
    var body: some View {
        VStack(spacing: 40) {
            Text("U Look Like...")
                .modifier(SubTitle2())
            VStack {
                ForEach(result.faces, id: \.self) { faces in
                    HStack(spacing: 16) {
                        Text(faces.celebrity.value)
                            .fontWeight(.medium)
                            .frame(width: 60)
                            .multilineTextAlignment(.leading)
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.gray)
                                .frame(width: lineWidth, height: 10)
                                .opacity(0.4)
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.pink)
                                .frame(width: lineWidth * faces.celebrity.confidence, height: 10)
//                                .frame(width: isOpen ? lineWidth * faces.celebrity.confidence : 0,
//                                       height: 10,
//                                       alignment: .leading)
//                                .animation(Animation.linear(duration: 1.5), value: isOpen)
                        }
                    }

                }
            }
        }
//        .onAppear {
//            isOpen = true
//        }
    }
}

#Preview {
    ResultList(result: CelebrityResponse(
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
