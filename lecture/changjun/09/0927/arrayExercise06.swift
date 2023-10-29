//
//  arrayExercise06.swift
//  prac2
//
//  Created by phang on 2023/09/27.
//

import Foundation

// MARK: - array 예제 06

class ArrayExercise06 {
    private var stringArr = ["수", "박"]
    
    func greeting() {
        print("=== 수박 게임 시작! ===")
    }
    
    func runProgram() {
        greeting()
        let num = getIntTypeInputValue(message: "숫자를 입력해주세요: ")
        let ouput = getOutputString(length: num)
        print(ouput)
    }
    
    func getOutputString(length: Int) -> String {
        let pattern = stringArr.joined()
        let (q, r) = length.quotientAndRemainder(dividingBy: pattern.count)
        var result = String(repeating: pattern, count: q)
        if r != 0 {
            let remainder = pattern.prefix(r)
            result += remainder
        }
        return result
    }
}


extension ArrayExercise06 {
    
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

