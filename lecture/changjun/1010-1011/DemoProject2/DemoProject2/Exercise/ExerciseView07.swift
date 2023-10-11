//
//  ExerciseView07.swift
//  DemoProject2
//
//  Created by phang on 10/11/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct ExerciseView07: View {
    @State private var inputTime: Int?
    @State private var wage: Int?
    
    private let hourlyWage = 10_000
    private let basicWorkingHour = 8
    private var overCharge: Int { Int(Double(hourlyWage) * 1.5) }
    
    var body: some View {
        
        PhangVStack {
            Label("A Pay Calculator", systemImage: "wonsign.arrow.circlepath")
                .font(.largeTitle)
            
            Divider()
                .frame(height: 3)
                .background(Color.black)
        
            TextField("근무 시간 입력", value: $inputTime, format: .number)
                .modifier(MyTextField())
                .onChange(of: inputTime) { wage = getResult() }
            
            Text("총 급여: \(wage ?? 0) 원")
                .font(.title3)
            
        }
    }
    
    private func getResult() -> Int {
        guard let time = inputTime else { return 0 }
        let wage = time > 8 ? ((hourlyWage * 8) + (time - 8) * overCharge) : (hourlyWage * time)
        return wage
    }
}

@available(iOS 17.0, *)
#Preview {
    ExerciseView07()
}
