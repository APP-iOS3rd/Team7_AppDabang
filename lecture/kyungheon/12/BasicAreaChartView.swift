//
//  BasicAreaChartView.swift
//  ApiDemo
//
//  Created by lkh on 12/22/23.
//

import SwiftUI
import Charts

struct BasicAreaChartView: View {
    var body: some View {
        Chart {
            AreaMark(
                x: PlottableValue.value("Month", "Jun"),
                y: PlottableValue.value("Temp", 50)
            )

            // PlottableValue 생략 가능
            AreaMark(
                x: .value("Month", "Feb"),
                y: .value("Temp", 43)
            )

            AreaMark(
                x: .value("Month", "Mar"),
                y: .value("Temp", 61)
            )

        }
    }
}

#Preview {
    BasicAreaChartView()
}
