//
//  Ex7View.swift
//  XcodeExample
//
//  Created by 박호건 on 10/11/23.
//

import SwiftUI

struct Ex7View: View {
    @State private var time: String = ""
    @State private var result: String = ""

    var body: some View {
        VStack {
            Image(systemName: "clock")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("\(result)")
                .foregroundColor(.white)


            HStack {
                TextField("근무시간 시급계산기", text: $time)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: buttonPressed, label: { Text("변환")})
                    .foregroundColor(.white)
            }
        }
        .padding(10)
        .background(Color.indigo)
    }

    func buttonPressed() {
        if let t = Double(time) {
            if t > 8 {
                result = String( (8.0 * 10000.0) + ((t - 8.0) * (10000.0 * 1.5)) )
            }else{
                result = String((8 * 10000))
            }
        }else{
            result = ""
        }
    }
}

#Preview {
    Ex7View()
}
