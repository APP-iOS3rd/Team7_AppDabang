//
//  ExerciseView09.swift
//  DemoProject2
//
//  Created by phang on 10/12/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct ExerciseView09: View {
    @State private var inputNum: Int?
    @State private var result: String?
    
    var body: some View {
        ZStack {
            Color.mint.edgesIgnoringSafeArea(.all)
            
            PhangVStack {
                Label("EVEN or ODD", systemImage: "questionmark.circle")
                    .font(.largeTitle)
                
                Divider()
                    .frame(height: 3)
                    .background(Color.white)
                
                TextField("정수 입력", value: $inputNum, format: .number)
                    .modifier(MyTextField())
                    .onChange(of: inputNum) { result = getOddOrEven() }
                
                Text("\(inputNum ?? 0) 는(은) \(result ?? "?") 입니다.")
                
            }
            .fontWeight(.bold)
            .foregroundColor(Color.white)
        }
    }
    
    private func getOddOrEven() -> String? {
        guard let inputNum = self.inputNum, inputNum != 0 else { return nil }
        let result = inputNum % 2 == 0 ? "짝수" : "홀수"
        return result
    }
}


@available(iOS 17.0, *)
#Preview {
    ExerciseView09()
}
