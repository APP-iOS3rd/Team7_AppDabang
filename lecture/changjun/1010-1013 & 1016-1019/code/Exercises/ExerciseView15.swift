//
//  ExerciseView15.swift
//  DemoProject2
//
//  Created by phang on 10/19/23.
//

import SwiftUI

struct ExerciseView15: View {
    @State private var num1: Int?
    @State private var num2: Int?
    @State private var result = 0
    @State private var showingAlert = false
    
    var body: some View {
        VStack(spacing: 40) {
            Group {
                Label("Asnc Await - sum", systemImage: "plus.circle")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Num1 ~ Num2")
                    .font(.title2)
            }
            
            HStack(spacing: 20) {
                TextField("num 1", value: $num1, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                
                TextField("num 2", value: $num2, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
            }
            
            Divider()
                .frame(height: 1)
                .background(Color.black)
            
            Text("Result : \(result)")
            
            Button(action: {
                Task {
                    await result = sum(start: num1 ?? 0, end: num2 ?? 0)
                }
            }, label: {
                Text("Check Result")
            })
            .buttonStyle(.borderedProminent)
            .alert("입력이 잘못되었습니다.", isPresented: $showingAlert) {
                Button("OK", role: .cancel) {
                    showingAlert = false
                    num1 = nil
                    num2 = nil
                }
            }
        }
        .padding(.horizontal, 20)
    }
    
    func sum(start: Int, end: Int) async -> Int {
        guard start <= end else {
            self.showingAlert = true
            return 0
        }
        guard start != end else { return start }

        var totalSum: Int = 0
        let indexList: [Int] = [start, end]

        await withTaskGroup(of: (Int, Int).self) { group in
            group.addTask {
                return (await sumFrom(indexList[0], indexList[1] / 2), await sumFrom(indexList[1] / 2 + 1, indexList[1]))
            }
            for await (a, b) in group {
                totalSum += (a + b)
            }
        }
        return totalSum
    }
    
//    func sum(start: Int, end: Int) async -> Int {
//        guard start != end else { return start }
//        async let a = sumFrom(start, end / 2)
//        async let b = sumFrom(end / 2 + 1, end)
//        return (await a) + (await b)
//    }
    
    func sumFrom(_ start: Int, _ end: Int) async -> Int {
        guard start != end else { return start }
        return (start...end).reduce(0, +)
    }
}

#Preview {
    ExerciseView15()
}
