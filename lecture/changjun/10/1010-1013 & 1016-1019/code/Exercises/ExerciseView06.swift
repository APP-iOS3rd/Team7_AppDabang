//
//  ExerciseView06.swift
//  DemoProject2
//
//  Created by phang on 10/11/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct ExerciseView06: View {
    @State private var inputSecond: Int?
    @State private var resultTime = (h: 0, m: 0, s: 0)
    
    var body: some View {
        
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            PhangVStack {
                Label("Time Converter", systemImage: "clock.badge.questionmark")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                
                Divider()
                    .frame(height: 3)
                    .background(Color.white)
                
                TextField("초 입력", value: $inputSecond, format: .number)
                    .modifier(MyTextField())
                    .onChange(of: inputSecond) { resultTime = getResult() }
                
                Text("\(resultTime.h) 시간 \(resultTime.m) 분 \(resultTime.s) 초")
                    .font(.title3)
                    .foregroundColor(Color.white)
            }
        }
    }
    
    private func getResult() -> (Int, Int, Int) {
        guard let second = inputSecond else { return (0, 0, 0) }
        let h = second / 3600
        let m = (second % 3600) / 60
        let s = second % 60
        return (h, m, s)
    }
    
}

@available(iOS 17.0, *)
#Preview {
    ExerciseView06()
}
