//
//  ExerciseView01.swift
//  DemoProject2
//
//  Created by phang on 10/11/23.
//

import SwiftUI

struct ExerciseView01: View {
    @State private var num1: Int?
    @State private var num2: Int?
    @State private var result = (add: 0, sub: 0, multiple: 0, divide:0)
    
    private let operationArray = ["add", "sub", "multiple", "divide"]
    private let buttonText = "Check Result"
    
    var body: some View {
        VStack {
            TextField("첫번째 숫자를 입력해주세요.", value: $num1, format: .number)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            TextField("두번째 숫자를 입력해주세요.", value: $num2, format: .number)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            Button(
                action: {
                    result = buttonPressed()
                },
                label: {
                    Text(buttonText)
                        .foregroundColor(.gray)
                }
            )
            .padding(10)
            .buttonStyle(.bordered)
            
            VStack(alignment: .leading) {
                ForEach(operationArray, id: \.self) { key in
                    let value = Operator(rawValue: key)!.data
                    HStack {
                        Image(systemName: value.iconName)
                            .imageScale(.medium)
                            .foregroundStyle(.pink)
                        Text(value.text + getResult(for: key))
                    }
                }
            }
        }
        .padding(50)
    }
    
    private func buttonPressed() -> (Int, Int, Int, Int) {
        guard let n1 = num1, let n2 = num2 else { return (0, 0, 0, 0) }
        return (n1 + n2, n1 - n2, n1 * n2, n1 / n2)
    }
    
    private func getResult(for operation: String) -> String {
        switch operation {
        case Operator.add.rawValue:
            return "\(result.add)"
        case Operator.sub.rawValue:
            return "\(result.sub)"
        case Operator.multiple.rawValue:
            return "\(result.multiple)"
        case Operator.divide.rawValue:
            return "\(result.divide)"
        default:
            return ""
        }
    }
    
}

enum Operator: String {
    case add, sub, multiple, divide
    
    var data: (iconName: String, text: String) {
        switch self {
        case .add:
            return (iconName: "plus.circle", text: "더하기 결과: ")
        case .sub:
            return (iconName: "minus.circle", text: "빼기 결과: ")
        case .multiple:
            return (iconName: "multiply.circle", text: "곱하기 결과: ")
        case .divide:
            return (iconName: "divide.circle", text: "나누기 결과: ")
        }
    }
}

#Preview {
    ExerciseView01()
}
