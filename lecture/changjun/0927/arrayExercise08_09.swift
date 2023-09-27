//
//  arrayExercise08_09.swift
//  prac2
//
//  Created by phang on 2023/09/27.
//

import Foundation

// MARK: - array 예제 08 - 09

class ArrayExercise08_09 {
    private let correctAnswer = [1, 1, 4, 2, 3]
    private var myAnswer = [Int]()
    
    /// 08
    func arrayExercise08() {
        print("=== 채점하기! ===")
        print("답을 입력하세요")
        getAnswer()
        print("정답확인")
        let output = checkAnswer()
        print(output)
    }
    
    func getAnswer() {
        for i in 1...correctAnswer.count {
            let answer = getIntTypeInputValue(message: "\(i)번 답: ")
            self.myAnswer.append(answer)
        }
    }
    
    func checkAnswer() -> String {
        var score = 0
        let result = zip(correctAnswer, myAnswer).map { (c, m) in
            score += (c == m) ? 20 : 0
            return (c == m) ? "O" : "X"
        }.joined(separator: " ") + " 최종 점수 \(score)점"
        return result
    }
    
    /// 09
    func arrayExercise09() {
        let starArr = self.correctAnswer.map { num in
            return String(repeating: "*", count: num)
        }
        zip(correctAnswer, starArr).forEach { (num, star) in
            print("\(num): \(star)")
        }
    }
}


extension ArrayExercise08_09 {
    
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
