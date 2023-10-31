//
//  AlignmentZStackView.swift
//  DemoProject2
//
//  Created by phang on 10/30/23.
//

import SwiftUI

extension VerticalAlignment {
    private enum CrossAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.bottom]
        }
    }
    static let crossAlignment = VerticalAlignment(CrossAlignment.self)
}

// p.294
extension HorizontalAlignment {
    enum MyHorizontal: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[HorizontalAlignment.center]
        }
    }
    static let myAlignment = HorizontalAlignment(MyHorizontal.self)
}

extension VerticalAlignment {
    private enum MyVertical: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[VerticalAlignment.center]
        }
    }
    static let myAlignment = VerticalAlignment(MyVertical.self)
}

// p.295
extension Alignment {
    static let myAlignment = Alignment(horizontal: .myAlignment, vertical: .myAlignment)
}

struct AlignmentZStackView: View {
    var body: some View {
        // 스택 정렬 교차 ( 스택 겹치기 ) p.291
//        HStack(alignment: .crossAlignment, spacing: 20) {
//            Circle()
//                .foregroundStyle(.pink)
//                .frame(width: 100)
//                .alignmentGuide(.crossAlignment, computeValue: { d in
//                    d[VerticalAlignment.center]
//                })
//            VStack {
//                Rectangle()
//                    .foregroundStyle(.teal)
//                    .frame(width: 100, height: 100)
//                Rectangle()
//                    .foregroundStyle(.purple)
//                    .frame(width: 100, height: 100)
//                Rectangle()
//                    .foregroundStyle(.quaternary)
//                    .frame(width: 100, height: 100)
//                    .alignmentGuide(.crossAlignment, computeValue: { d in
//                        d[VerticalAlignment.center]
//                    })
//                Rectangle()
//                    .foregroundStyle(.orange)
//                    .frame(width: 100, height: 100)
//            }
//        }
//        .padding()
        
        // p.295
        ZStack(alignment: Alignment.myAlignment) {
            Rectangle()
                .foregroundStyle(Color.pink)
                .alignmentGuide(HorizontalAlignment.myAlignment) {
                    $0[HorizontalAlignment.trailing]
                }
                .alignmentGuide(VerticalAlignment.myAlignment) {
                    $0[VerticalAlignment.bottom]
                }
                .frame(width: 100, height: 100)
            
            Rectangle()
                .foregroundStyle(Color.green)
                .alignmentGuide(HorizontalAlignment.myAlignment) {
                    $0[HorizontalAlignment.center]
                }
                .alignmentGuide(VerticalAlignment.myAlignment) {
                    $0[VerticalAlignment.top]
                }
                .frame(width: 100, height: 100)
            
            Circle()
                .foregroundStyle(Color.yellow)
                .alignmentGuide(HorizontalAlignment.myAlignment) {
                    $0[HorizontalAlignment.leading]
                }
                .alignmentGuide(VerticalAlignment.myAlignment) {
                    $0[VerticalAlignment.bottom]
                }
                .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    AlignmentZStackView()
}
