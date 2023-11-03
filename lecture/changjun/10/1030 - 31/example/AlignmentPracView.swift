//
//  AlignmentPracView.swift
//  DemoProject2
//
//  Created by phang on 10/30/23.
//

import SwiftUI

extension VerticalAlignment {
    private enum OneThird: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d.height / 3
        }
    }
    static let oneThird = VerticalAlignment(OneThird.self)
}

struct AlignmentPracView: View {
    var body: some View {
        VStack(spacing: 50) {
            // 컨테이너 정렬 VStack
            VStack(alignment: .trailing) {
                Text("This is some text")
                Text("This is some longer text")
                Text("This is short")
            }
            // 컨테이너 정렬 HStack
            HStack(alignment: .lastTextBaseline, spacing: 20) {
                Text("This is some text")
                    .font(.largeTitle)
                Text("This is some longer text")
                    .font(.body)
                Text("This is short")
                    .font(.headline)
            }
            // 정렬 가이드 p.285
            VStack(alignment: .leading) {
                Rectangle()
                    .foregroundStyle(Color.teal)
                    .frame(width: 120, height: 50)
                Rectangle()
                    .foregroundStyle(Color.pink)
                    .frame(width: 120, height: 50)
                    .alignmentGuide(.leading, computeValue: { dimension in
                        60.0
                    })
                Rectangle()
                    .foregroundStyle(Color.orange)
                    .frame(width: 120, height: 50)
                    .alignmentGuide(.leading, computeValue: { dimension in
                        dimension.width / 10
                    })
                // HorizontalAlignment, VerticalAlignment 프로퍼티에 접근
                Rectangle()
                    .foregroundStyle(Color.cyan)
                    .frame(width: 120, height: 50)
                    .alignmentGuide(.leading, computeValue: { dimension in
                        dimension[HorizontalAlignment.trailing]
                    })
            }
            // 커스텀 정렬 타입 p.288
            HStack(alignment: .oneThird) {
                Rectangle()
                    .foregroundStyle(Color.teal)
                    .frame(width: 50, height: 120)
                Rectangle()
                    .foregroundStyle(Color.pink)
                    .frame(width: 50, height: 120)
                    .alignmentGuide(.oneThird, computeValue: { dimension in
                        dimension[VerticalAlignment.top]
                    })
                Rectangle()
                    .foregroundStyle(Color.orange)
                    .frame(width: 50, height: 120)
                Rectangle()
                    .foregroundStyle(Color.cyan)
                    .frame(width: 50, height: 120)
                    .alignmentGuide(.oneThird, computeValue: { dimension in
                        dimension[VerticalAlignment.bottom]
                    })
            }
        }
    }
}

#Preview {
    AlignmentPracView()
}
