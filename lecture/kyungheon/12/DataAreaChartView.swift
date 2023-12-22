//
//  DataAreaChartView.swift
//  ApiDemo
//
//  Created by lkh on 12/22/23.
//

import SwiftUI
import Charts

// 차트에 데이터 전달
struct MontylyTemp: Identifiable {
    var id = UUID()
    var month: String
    var degree: Int
}

let tempData: [MontylyTemp] = [
    MontylyTemp(month: "Jan", degree: 50),
    MontylyTemp(month: "Feb", degree: 43),
    MontylyTemp(month: "Mar", degree: 61)
]

struct DataAreaChartView: View {
    var body: some View {

        Chart(tempData) { data in
            AreaMark(
                x: .value("Month", data.month),
                y: .value("Temp", data.degree)
            )
        }
        Spacer()
        // ForEach 를 이용한 위와 동일한 코드
        Chart {
            ForEach(tempData) { data in
                AreaMark(
                    x: .value("Month", data.month),
                    y: .value("Temp", data.degree)
                )
            }
        }

    }
}

#Preview {
    DataAreaChartView()
}
