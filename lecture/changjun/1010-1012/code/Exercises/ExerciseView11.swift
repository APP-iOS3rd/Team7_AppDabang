//
//  ExerciseView11.swift
//  DemoProject2
//
//  Created by phang on 10/12/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct ExerciseView11: View {
    @State private var ballCount: Int?
    @State private var box: Int?

    private let boxLimit = 5
    
    var body: some View {
        PhangVStack {
            Text("🏀")
                .font(.system(size: 100))
            
            Text("BasketBall Count")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("농구공 개수", value: $ballCount, format: .number)
                .modifier(MyTextField())
                .onChange(of: ballCount) {
                    box = getBoxCount()
                }
            
            Text("필요한 박스의 수는 \(box ?? 0) 개 입니다.")
                .font(.headline)
        }
    }
    
    private func getBoxCount() -> Int {
        guard let ball = ballCount, ball > 0 else { return 0 }
        let result =  ball % boxLimit == 0 ? ball / boxLimit : ball / boxLimit + 1
        return result
    }
    
}

@available(iOS 17.0, *)
#Preview {
    ExerciseView11()
}
