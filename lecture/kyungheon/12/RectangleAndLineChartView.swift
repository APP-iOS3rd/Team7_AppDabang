//
//  RectangleAndLineChartView.swift
//  ApiDemo
//
//  Created by lkh on 12/22/23.
//

import SwiftUI
import Charts

// 마크 타입 결합
//  동일한 데이터를 동일한 차트 내에서 여러 가지 방식으로 표시(선과 막대그래프)
struct RectangleAndLineChartView: View {
    var body: some View {

        Chart(tempData) { data in
            RectangleMark(
                x: .value("Month", data.month),
                y: .value("Temp", data.degree)
            )

            LineMark(
                x: .value("Month", data.month),
                y: .value("Temp", data.degree)
            )
        }
    }
}
#Preview {
    RectangleAndLineChartView()
}
