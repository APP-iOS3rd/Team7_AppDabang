//
//  ExerciseView10.swift
//  DemoProject2
//
//  Created by phang on 10/12/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct ExerciseView10: View {
    @State private var numA: Int?
    @State private var numB: Int?
    @State private var result: Int?
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            PhangVStack {
                Image(systemName: "arrowshape.left.arrowshape.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding(.bottom, -50)

                
                Text("Two Numbers")
                    .font(.largeTitle)
                
                Divider()
                    .frame(height: 3)
                    .background(Color.white)
                
                HStack(spacing: 30) {
                    TextField("정수 입력", value: $numA, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .onChange(of: numA) {
                            result = getDiffrence()
                        }
                    TextField("정수 입력", value: $numB, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .onChange(of: numB) {
                            result = getDiffrence()
                        }
                }
                .padding(.horizontal, 10)
                
                Text("두 수의 차이는 \(result ?? 0) 입니다.")
                    .font(.headline)
                
            }
            .fontWeight(.bold)
            .foregroundColor(Color.white)
        }
    }
    
    private func getDiffrence() -> Int {
        guard let numA = self.numA, let numB = self.numB else { return 0 }
        let result = numA > numB ? numA - numB : numB - numA
        return result
    }
}

@available(iOS 17.0, *)
#Preview {
    ExerciseView10()
}
