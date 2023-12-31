//
//  calculatorClassExercise.swift
//  prac2
//
//  Created by phang on 2023/09/26.
//

import Foundation

// MARK: -  Calculator / Class 예제 05

class Calculator {
    private var num1: Int
    private var num2: Int
    
    init(num1: Int, num2: Int) {
        self.num1 = num1
        self.num2 = num2
    }
    
    func setNum1(newNum: Int) {
        let tmp = self.num1
        self.num1 = newNum
        showChangeValue(before: tmp, after: self.num1)
    }
    
    func setNum2(newNum: Int) {
        let tmp = self.num2
        self.num2 = newNum
        showChangeValue(before: tmp, after: self.num2)
    }
    
    func sum() -> Int {
        return self.num1 + self.num2
    }
    
    func sub() -> Int {
        return self.num1 - self.num2
    }
    
    func mul() -> Int {
        return self.num1 * self.num2
    }
    
    func div() -> Int {
        return self.num1 / self.num2
    }
  
}

extension Calculator {
    private func showChangeValue(before: Int, after: Int) {
        print("num2 의 값이 \(before)에서, \(after)로 설정되었습니다.")
    }
}
