//
//  Ex6View.swift
//  XcodeExample
//
//  Created by 박호건 on 10/11/23.
//

import SwiftUI

struct Ex6View: View {
        @State private var second: String = ""
        @State private var result: String = ""

        var body: some View {
            VStack {
                Image(systemName: "clock")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("시간을 입력해 주세요")
                    .foregroundColor(.white)


                HStack {
                    TextField("초를 입력 받아 [시, 분, 초]로 변환할 초를 넣어주세요", text: $second)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button(action: buttonPressed, label: { Text("변환")})
                        .foregroundColor(.white)
                }
            }
            .padding(10)
            .background(Color.indigo)
        }

        func buttonPressed() {
            if let t = Int(second) {
                let m = (t / 60) % 60
                let h = (t / 60) / 60
                let s = t % 60
                result = "\(h)시 \(m)분 \(s)초"
            }else{
                result = ""
            }
        }
    }


#Preview {
    Ex6View()
}
