//
//  ExerciseView05.swift
//  DemoProject2
//
//  Created by phang on 10/11/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct ExerciseView05: View {
    @State private var score: (swift: Int?, ios: Int?, web: Int?)
    @State private var result = (total: 0, avg: 0)
    
    private let buttonText = "Check"
    
    var body: some View {
        VStack {
            TextField("Swift 성적", value: $score.swift, format: .number)
                .modifier(MyTextField())
                .onChange(of: score.swift) { result = getResult() }
            TextField("iOS 성적", value: $score.ios, format: .number)
                .modifier(MyTextField())
                .onChange(of: score.ios) { result = getResult() }
            TextField("Web 성적", value: $score.web, format: .number)
                .modifier(MyTextField())
                .onChange(of: score.web) { result = getResult() }
            
            Text("Total: \(result.total)\nAVG: \(result.avg)")
                .lineSpacing(10)
                .padding(10)
        }
        .padding(10)
    }
    
    private func getResult() -> (Int, Int) {
        let swift = score.swift ?? 0
        let ios = score.ios ?? 0
        let web = score.web ?? 0
        let total = swift + ios + web
        let avg = total / 3
        return (total, avg)
    }
    
}

@available(iOS 17.0, *)
#Preview {
    ExerciseView05()
}
