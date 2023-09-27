//
//  arrayExercise07.swift
//  prac2
//
//  Created by phang on 2023/09/27.
//

import Foundation

// MARK: - array 예제 07

class ArrayExercise07 {
    private var arr = [Int]()
    
    init(arrCount: Int) {
        self.arr = Array(repeating: 0, count: arrCount)
        runProgram()
    }
        
    func runProgram() {
        inputAndSetArray()
        let output = getMultipleOfThree()
        let formattedOutput = output.map{ String($0) }.joined(separator: " ")
        print("3의 배수: \(formattedOutput)")
    }
    
    func inputAndSetArray() {
        for i in 0..<self.arr.count {
            let inputNum = getIntTypeInputValue(message: "\(i + 1)번째 정수 입력: ")
            self.arr[i] = inputNum
        }
    }
    
    func getMultipleOfThree() -> [Int] {
        let multipleOfThree = self.arr.filter{ $0 % 3 == 0 }
        return multipleOfThree
    }
}


extension ArrayExercise07 {
    
    // MARK: - [ 정수 입력 함수 ]
    private func getIntTypeInputValue(message msg: String) -> Int {
        print("\(msg)", terminator: "")
        guard let input = readLine(), let intNum = Int(input) else {
            print("입력 값 오류 - 정수를 입력하세요.")
            return getIntTypeInputValue(message: msg)
        }
        return intNum
    }
    
}
