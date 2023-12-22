//
//  YearLineChartView.swift
//  ApiDemo
//
//  Created by lkh on 12/22/23.
//

import SwiftUI
import Charts

struct StyleBarChartView: View {
    var body: some View {

        Chart(tempData.filter{$0.year == "2021"}) { data in
            BarMark (
                x: .value("Month", data.month),
                y: .value("Temp", data.degree)
            )
            .foregroundStyle(by: .value("Month", data.month))
            .annotation {
                Text("\(data.degree)")
                    .foregroundStyle(.brown)
            }

        }

    }
}

#Preview {
    StyleBarChartView()
}
